defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon
  doctest Identicon.Image

  test "Main" do
    assert Identicon.main("abc") == %Identicon.Image{
              hex: [144, 1, 80, 152, 60, 210, 79, 176, 214, 150, 63, 125, 40,
               225, 127, 114]
            }
  end

  test "Hash's list" do
    assert Identicon.hash_input("abc") == %Identicon.Image{
              hex: [144, 1, 80, 152, 60, 210, 79, 176, 214, 150, 63, 125, 40,
               225, 127, 114]
            }
  end
end
