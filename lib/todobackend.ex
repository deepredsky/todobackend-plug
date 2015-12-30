defmodule Todobackend do
  use Application

  def start(_type, _args) do
    Todobackend.Supervisor.start_link
  end
end
