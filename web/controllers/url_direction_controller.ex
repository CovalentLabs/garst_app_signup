defmodule GarstAppSignup.URLDirectionController do
  use GarstAppSignup.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def direct(conn, %{ "route" => route, "token" => token}) do
    render conn, "direct.html", route: route, token: token
  end
end