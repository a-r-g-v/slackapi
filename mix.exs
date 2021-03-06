defmodule Slackapi.Mixfile do
  use Mix.Project

  def project do
    [app: :slackapi,
      version: "0.0.1",
      elixir: "~> 1.0",
      escript: escript_config,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]

  end

  def escript_config do
    [main_module: SlackAPI.CLI]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:httpoison, "~> 0.7.2"},
      {:poison, "~> 1.5"}]

  end
end
