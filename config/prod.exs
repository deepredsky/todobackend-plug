use Mix.Config

config :todobackend, Todobackend.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"},
  size: 20 # The amount of database connections in the pool

config :todobackend, base_url: "https://todobackend-plug.herokuapp.com/"
