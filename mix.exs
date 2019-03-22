defmodule Hades.MixProject do
  use Mix.Project

  def project do
    [
      app: :hades,
      version: "0.1.0",
      elixir: "~> 1.8",
      escript: escript(),
      deps: deps()
    ]
  end

  defp escript do
    [
      main_module: Hades.CLI
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 0.5",   only: :dev}
    ]
  end
end
