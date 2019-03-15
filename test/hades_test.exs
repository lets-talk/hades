defmodule HadesTest do
  use ExUnit.Case
  doctest Hades

  test "greets the world" do
    assert Hades.hello() == :world
  end
end
