defmodule GarstApp.SmsHookController do
  use GarstApp.Web, :controller

  # I should clean this up eventually...
  # Once I get more comfortable with Elixir syntax again
  # I'll be able to come back in and focus less on semantics
  # and trivial libraries, and I'll focus on explaining the code,
  # and better organization.
  def index(conn, params = %{
        "Body" => _body, "From" => _from, "To" => _to,
        "AccountSid" => account_sid }) do
    valid_sid = account_sid == Application.get_env(:ex_twilio, :account_sid)
    # valid_to = to == Application.get_env(:ex_twilio, :send_number)

    # Mostly just for development now
    # If this fails, then we check the Twilio Signature 
    if check_auth(get_req_header(conn, "authorization")) do
      store_message(conn, params, valid_sid)

    else
      case twilio_security(conn) do
        {:ok} -> store_message(conn, params, valid_sid)
        error ->
          IO.inspect error
          store_message(conn, params, false)
      end
    end
  end

  # Dissect authorization header to check validity
  defp check_auth([ "Basic " <> basic_auth ]) do
    case Application.get_env(:ex_twilio, :basic_auth) do
      # If environment variable is blank, always fail!
      # Once I'm more comfortable with the language, I'll be able to come in and put tests.
      "" -> false

      env_basic_auth ->
        encoded_env_auth = env_basic_auth |> Base.encode64()
        basic_auth == encoded_env_auth
    end
  end

  # No authorization header is not valid
  defp check_auth(_auth) do
    false
  end

  defp store_message(conn, _params, false) do
    send_resp(conn, 401, "Oh no! Don't go down Twilio! I'm sorry. I'm so sorry.'")
  end

  defp store_message(conn, _params, true) do
    send_resp(conn, 200, "")
  end

  # Follows the algorithm provided by Twilio
  defp twilio_security(%{ host: host, request_path: reqpath, params: params } = conn) do
    fullpath = "https://" <> host <> reqpath
    fullurl = 
      case conn do
        %{ query_string: qs } when qs != "" -> fullpath <> "?" <> qs
        _ -> fullpath
      end
    
    provided_signature = 
      case get_req_header(conn, "x-twilio-signature") do
        [twilioSignature] -> twilioSignature
        _ -> ""
      end

    params_concatenated = Enum.map(params, fn({k, v}) -> k <> v end)
      |> Enum.join("")

    secret_key = Application.get_env(:ex_twilio, :auth_token)

    data = fullurl <> params_concatenated
    compare_signature = :crypto.hmac(:sha, secret_key, data) |> Base.encode64()
    
    case compare_signature do
      ^provided_signature -> { :ok }
      _ -> { :invalid,
        reason: "Invalid Authentication",
        url: fullurl, params: params_concatenated,
        signature: provided_signature, compare_to: compare_signature }
    end
  end
end