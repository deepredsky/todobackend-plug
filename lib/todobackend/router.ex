defmodule Todobackend.Router do
  use Plug.Router

  alias Todobackend.Todo, warn: false
  alias Todobackend.Repo, warn: false
  import Ecto.Query, warn: false

  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger, log: :debug
  end

  plug Plug.Parsers, parsers: [Plug.Parsers.URLENCODED, Plug.Parsers.JSON],
                     json_decoder: Poison
  plug CORSPlug
  plug :match
  plug :dispatch

  get "/" do
    query = (from t in Todo, select: t)
    todos = query |> Repo.all
                  |> Poison.encode!
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, todos)
  end

  get "/:todo_id" do
    todo = Todo |> Repo.get(todo_id)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(todo))
  end

  post "/" do
    changeset = Todo.changeset(%Todo{}, conn.params)
    case Repo.insert(changeset) do
      {:ok, todo} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(todo))
      {:error, _changeset} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(422, "Error saving the todo")
    end
  end

  delete "/" do
    case Repo.delete_all(Todo) do
      {_number, nil} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!([]))
      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(422, "Delete Failed")
    end
  end

  patch "/:todo_id" do
    changeset =
    conn.params |> Enum.filter(fn
      {_, nil} -> false
      _        -> true
    end) |> Enum.into(%{})
    todo = Todobackend.Todo |> Repo.get(todo_id)
    patch_changeset = Todo.changeset(todo, changeset)

    case Todobackend.Repo.update(patch_changeset) do
      {:ok, todo} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(todo))
      {:error, _changeset} ->
        conn
        |> send_resp(500, "Update failed!")
    end
  end

  delete "/:todo_id" do
    todo = Todo |> Repo.get(todo_id)
    case Repo.delete(todo) do
      {:ok, todo} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(todo))
      _ ->
        conn
        |> send_resp(500, "Update failed!")
    end
  end
end
