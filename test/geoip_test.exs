defmodule GeoipTest do
  use ExUnit.Case
  doctest Geoip

  test "greets the world" do
    assert Geoip.hello() == :world
  end
end
