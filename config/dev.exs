use Mix.Config

config :todobackend, Todobackend.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "todobackend_plug",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :todobackend, base_url: "https://localhost:4000/"
