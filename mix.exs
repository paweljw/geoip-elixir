defmodule Geoip.MixProject do
  use Mix.Project

  def project do
    [
      app: :geoip,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [
        :geolix
      ],
      extra_applications: [:logger],
      mod: {Geoip, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:geolix, "~> 0.16"}
    ]
  end
end
