defmodule Identicon.Image do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Get image hex.

  ## Examples
      iex> %Identicon.Image{}
      %Identicon.Image{hex: nil}
  """
  defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end
