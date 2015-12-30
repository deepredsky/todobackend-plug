defmodule Todobackend.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    [ worker(Todobackend.Repo, []),
      worker(Todobackend.Starter, [])
    ] |> supervise strategy: :one_for_one
  end

end
