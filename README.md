# Todobackend

Sample TODO Backend app built using Elixir Plug

Tested against [Todo-Backend](http://todobackend.com/) spec

Most of the implementation is copied from [MaruTodo](https://github.com/whitfieldc/maru_todo) example

#### To Run

```sh
git clone https://github.com/deepredsky/todobackend-plug.git
cd todobackedn-plug
mix deps.get
mix ecto.create
mix ecto.migrate
iex -S mix
```

Test local version at [http://www.todobackend.com/specs/index.html?http://localhost:4000/tasks](http://www.todobackend.com/specs/index.html?http://localhost:4000/tasks)
