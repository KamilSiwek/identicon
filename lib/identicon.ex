defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Get string. Return list of hash.

  ## Examples
      iex> Identicon.main("abc")
      %Identicon.Image{
        hex: [144, 1, 80, 152, 60,
        210, 79, 176, 214, 150, 63,
        125, 40, 225, 127, 114]
      }
  """
  def main(input) do
    input |> hash_input
  end

  @doc """
  Get string. Return list of hash.

  ## Examples
      iex> Identicon.main("abc")
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
