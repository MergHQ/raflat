defmodule UnicafeMicroservice.MixProject do
  use Mix.Project

  def project do
    [
      app: :unicafe_microservice,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {UnicafeMicroservice, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.3"},
      {:plug, "~> 1.0"},
      {:plug_cowboy, "~> 1.0"},
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"}
    ]
  end
end
