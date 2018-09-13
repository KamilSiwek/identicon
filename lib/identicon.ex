defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Get string. Returns list of hash.

  ## Examples
      iex> Identicon.main("abc")
      [144, 1, 80]
  """
  def main(input) do
    input |> hash_input |> pick_color
  end
  @doc """
  Get data from hash_input. Returns color [r, g, b].
  """
  def pick_color(image) do
    # Change hex_list to [r, g, b | _tail] in {hex: hex_list}
    %Identicon.Image{hex: [r, g, b | _tail]} = image
    [r, g, b]
  end

  @doc """
  Get string. Returns list of hash.

  ## Examples
      iex> Identicon.hash_input("abc")
      %Identicon.Image{
        hex: [144, 1, 80, 152, 60,
        210, 79, 176, 214, 150, 63,
        125, 40, 225, 127, 114]
      }
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input) |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
