defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Get string. Returns list of hash.

  ## Examples
      iex> Identicon.main("abc")
      [
      [144, 1, 80, 1, 144],
      [152, 60, 210, 60, 152],
      [79, 176, 214, 176, 79],
      [150, 63, 125, 63, 150],
      [40, 225, 127, 225, 40]
      ]

  """
  def main(input) do
    input |> hash_input |> pick_color |> build_grid
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

  @doc """
  Get data from hash_input. Returns color [r, g, b].
  """
  def pick_color(image) do
    # Change hex_list to [r, g, b | _tail] in {hex: hex_list}
    %Identicon.Image{hex: [r, g, b | _tail]} = image
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
  Get string. Returns list of hash.

  ## Examples
      iex> image = %Identicon.Image{color: {144, 1, 80}, hex: [144, 1, 80, 152,\
      60, 210, 79, 176, 214, 150, 63, 125, 40, 225, 127, 114]}
      iex> Identicon.build_grid(image)
      [
      [144, 1, 80, 1, 144],
      [152, 60, 210, 60, 152],
      [79, 176, 214, 176, 79],
      [150, 63, 125, 63, 150],
      [40, 225, 127, 225, 40]
      ]
  """
  def build_grid(image) do
    %Identicon.Image{hex: hex} = image
    hex |> Enum.chunk(3) |> Enum.map(&mirror_row/1)
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end
end
