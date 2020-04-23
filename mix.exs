defmodule Aprs.MixProject do
  use Mix.Project

  def project do
    [
      app: :aprs_parse,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "aprs_parse",
      source_url: "https://github.com/Matt-Hornsby/aprs_parse"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21"},
      {:credo, "~> 1.4 ", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end

  defp description() do
    "Parse APRS messages into meaningful data structures"
  end

  defp package() do
    [
      name: "aprs_parse",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Matt-Hornsby/aprs_parse}"}
    ]
  end
end
