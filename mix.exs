defmodule SentenceTransformers.MixProject do
  use Mix.Project

  def project do
    [
      app: :sentence_transformers,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_targets: ["priv/venv"],
      make_clean: ["clean"],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_make, ">= 0.0.0", runtime: false},
      {:jason, ">= 0.0.0"},
    ]
  end
end