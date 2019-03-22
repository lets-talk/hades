defmodule Hades.CLI do
  
  @spec main([String.t()]) :: term()
  def main(args \\ []) do
    args
    |> commands
    |> process(arguments(args))
  end

  defp process(["new", name], args) do
    IO.puts "Creating your microservice #{name}..."
    IO.puts args
  end

  defp process([], _), do: process(["help"], [])
  defp process(["help"], _) do
    IO.puts """
    HELPING YOU:
    init <name> - create new microservice.
    help - ask for help.
    """
  end

  defp process(_commands, _) do
    IO.puts "I don't know how to do what you are asking about !"
  end

  defp arguments(args), do: Enum.filter(args, &is_argument/1)
  defp commands(args), do: Enum.filter(args, & !is_argument(&1))

  defp is_argument("-" <> _), do: true
  defp is_argument(_), do: false
end