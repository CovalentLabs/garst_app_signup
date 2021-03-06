# GarstApp

This project served as a landing page for the GarstApp launch, an app which Covalent intended to help students meet friends for lunch and dinner. The central idea is that there are many students living on campus and eating at our on-campus dining halls. Many of these students ate their meals alone–pining for a new friendship to rely on.

Behind GarstApp's design is a mixture of Lyft and meetup.com, for people to impulsively find others on campus to eat with. This idea was one among many different approaches Parrot and Covalent took towards helping students feel less lonely.

## Accepting your invitation
![Emailed invitation](https://user-images.githubusercontent.com/2925395/33000147-ecdf5eb2-cd6b-11e7-9a5c-527018eeda23.png)
Check out this [email template's source file](https://github.com/CovalentLabs/garst_app_signup/blob/62aae47c3e8d66cfc0ade25e0381d99ce6437d13/web/templates/url_direction/verified.html.eex)!

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Environment Variables

### `.env` file

It is recommended to hold a `.env` file in your working directory to configure the server for
development. An example `.env` file may contain the following lines of shell code to set up
environment variables.

```shell
# Your SMTP Username
export GA_SMTP_USERNAME=AWFAWF15WIOPJ094U2P330
# Your SMTP Password
export GA_SMTP_PASSWORD=AgawZA1G3455235+HRGx7123xikxI/paM125s1O
# Your SMTP Server name
export GA_SMTP_SERVER_NAME=email-smtp.us-west-2.amazonaws.com
# Your SMTP Port
export GA_SMTP_SERVER_PORT=465

# Sending Email addresses
# May be no-reply addresses
export GA_SEND_VERIFY_FROM=verify@notify.garstapp.com
export GA_SEND_NOTIFY_FROM=notify@notify.garstapp.com

# Your Twilio Account SID
export GA_TWILIO_ACCOUNT_SID=BF55cc277dac99096c1239102cd4160006
# Your Twilio auth token
export GA_TWILIO_AUTH_TOKEN=2078090060440e929188c2b5a5b7fa76
# The number in your Twilio acct you wish to send texts from
export GA_TWILIO_SEND_NUMBER=+15556667777

# This is the HTTP Basic Auth Header we can use to circumvent
# the Twilio signing process. Leaving this empty "" will disable this.
# So, in whatever dev environment we have, we may have POST Webhook to:
# https://@garstapp.com/hook/sms
export GA_TWILIO_HTTP_BASIC_AUTH=twilio:superhardpassword

```

## References

The developer of this repository refers to prior notes from https://github.com/ZombieHippie/phoenix-rumbl-tutorial

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
