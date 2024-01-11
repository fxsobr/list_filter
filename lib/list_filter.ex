defmodule ListFilter do
  def call([]) do
    {:error, "Empty list"}
  end

  def call(list) do
    {
      :ok,
      list
      |> Enum.filter(&String.match?(&1, ~r/^\-?\d+$/))
      |> Enum.map(&String.to_integer/1)
      |> Enum.filter(&(rem(&1, 2) == 1))
      |> Enum.count()
    }
  end
end
