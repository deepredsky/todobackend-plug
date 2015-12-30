defmodule Todobackend.Mixfile do
  use Mix.Project

  def project do
    [app: :todobackend,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :plug, :cowboy, :poison, :postgrex, :ecto],
     mod: {Todobackend, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:plug, "~> 1.0"},
      {:poison, "~> 1.4.0"},
      {:cors_plug, "~> 0.1.4"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 1.0"},
      {:cowboy, "~> 1.0.0"}]
  end
end
