defmodule UnicafeMicroserviceTest do
  use ExUnit.Case
  doctest UnicafeMicroservice

  test "greets the world" do
    assert UnicafeMicroservice.hello() == :world
  end
end
