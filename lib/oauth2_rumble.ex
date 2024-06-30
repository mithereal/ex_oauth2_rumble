defmodule Rumble.Oauth2 do
  @moduledoc false

  def json_library() do
    Application.get_env(:oauth2_rumble, :json_library, Jason)
  end
end
