defmodule Todobackend.Starter do
  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http Todobackend.Router, [], port: System.get_env("PORT") || 4000
  end
end
