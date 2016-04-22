defmodule Cronitor.Mixfile do
  use Mix.Project

  def project do
    [app: :cronitor,
     version: "1.0.0",
     name: "Cronitor",
     source_url: "https://github.com/jordan0day/cronitor.git",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: "An extremely simple wrapper for the cronitor.io ping endpoints.",
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :inets, :ssl]]
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
    [
      {:dialyze, "~>0.2", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/jordan0day/cronitor"},
      maintainers: ["Jordan Day"]
    ]
  end
end
