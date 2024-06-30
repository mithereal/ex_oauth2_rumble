
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/oauth2_rumble/)
[![Hex.pm](https://img.shields.io/hexpm/dt/oauth2_rumble.svg)](https://hex.pm/packages/oauth2_rumble)
![GitHub](https://img.shields.io/github/license/mithereal/ex_oauth2_rumble)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/mithereal/ex_oauth2_rumble/main)

### Rumble has broken api docs, this was grokked via locals.com requests, there may be dragons, maybe they need to hire me to fix the mess.

# Rumble Oauth

> Rumble OAuth2 strategy for Überauth/Assent.

## Installation

1. Setup your application at [Rumble Developers](https://rumble.com/).

1. Add `:ueberauth_rumble` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:oauth2_rumble, ">= 0.0.0"}]
    end
    ```

1. Add the strategy to your applications:

    ```elixir
    def application do
      [applications: [:oauth2_rumble]]
    end
    ```

1. Add Rumble to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        oauth2_rumble: {Rumble.Strategy.Ueberauth, []}
      ]
    ```

1.  Update your provider configuration:

    ```elixir
    config :ueberauth, Rumble.Strategy.OAuth2,
      client_id: System.get_env("RUMBLE_CLIENT_ID")
    ```

1.  Include the Überauth plug in your controller:

    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth
      ...
    end
    ```

1.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

    And make sure to set the correct redirect URI(s) in your Rumble application to wire up the callback.

1. Your controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initialize the request through:

    /auth/rumble


You must use something other than Rumble in the callback routes, I use /auth/td see below:

```elixir
config :ueberauth, Ueberauth,
  providers: [
    rumble: {Ueberauth.Strategy.Rumble,  [request_path: "/auth/rumble", callback_path: "/auth/rumble/callback"]}
  ]
```


## License

Please see [LICENSE](https://github.com/mithereal/ex_oauth2_rumble/blob/master/LICENSE) for licensing details.
