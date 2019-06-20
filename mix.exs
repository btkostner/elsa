defmodule Elsa.MixProject do
  use Mix.Project

  def project do
    [
      app: :elsa,
      version: "0.3.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      test_paths: test_paths(Mix.env())
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
      {:brod, "~> 3.7"},
      {:divo, "~> 1.1", only: [:dev, :test, :integration], override: true},
      {:divo_kafka, "~> 0.1.0", only: [:dev, :test, :integration]},
      {:placebo, "~> 1.2", only: [:dev, :test]},
      {:checkov, "~> 0.4.0", only: [:test]},
      {:ex_doc, "~> 0.20.2", only: [:dev]}
    ]
  end

  defp elixirc_paths(env) when env in [:test, :integration], do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp test_paths(:integration), do: ["test/integration"]
  defp test_paths(_), do: ["test/unit"]

  defp package do
    [
      maintainers: ["Brian Balser", "Jeff Grunewald", "Johnson Denen"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/bbalser/elsa"}
    ]
  end

  defp description do
    "Elsa is a full-featured Kafka library written in Elixir and extending the :brod library with additional support from the :kafka_protocol Erlang libraries to provide capabilities not available in :brod."
  end
end
