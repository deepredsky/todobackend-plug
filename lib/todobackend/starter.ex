defmodule Todobackend.Starter do
  def start_link() do
    port = String.to_integer( System.get_env("PORT") || "4000" )
    {:ok, _} = Plug.Adapters.Cowboy.http Todobackend.Router, [], port: port
  end
end
