defmodule Todobackend.Starter do
  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http Todobackend.Router, []
  end
end
