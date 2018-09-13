defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon
  doctest Identicon.Image

  test "Main" do
    assert Identicon.main("abc") == :ok
  end

end
