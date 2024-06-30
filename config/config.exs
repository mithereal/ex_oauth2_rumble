import Config

config :ueberauth, Ueberauth,
  providers: [
    oauth2_rumble:
      {Rumble.Strategy.Ueberauth,
       [request_path: "/auth/rumble", callback_path: "/auth/rumble/callback"]}
  ]

config :ueberauth, Rumble.Strategy.Ueberauth,
  client_id: System.get_env("RUMBLE_CLIENT_ID"),
  client_secret: System.get_env("RUMBLE_CLIENT_SECRET"),
  redirect_uri: "https://rumble.com/oauth.asp"
