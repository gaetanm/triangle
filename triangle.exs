defmodule Triangle do
  def type(a, b, c) do
    cond do
      equilateral?(a, b, c) ->
        IO.puts "This triangle is equilateral."
      right?(a, b, c) ->
        IO.puts "This triangle is right."
      isosceles?(a, b, c) ->
        IO.puts "This triangle is isosceles."
      true ->
        IO.puts "This is not a special triangle."
    end
  end

  defp equilateral?(a, b, c) do
    if (a == b) && (b == c) && (c == a), do: true
  end

  defp right?(a ,b, c) do
    h = hypotenuse(a, b, c)
    cond do
      a == h ->
        pythagorean(b, c, a)
      b == h ->
        pythagorean(a, c, b)
      c == h ->
        pythagorean(a, b, c)
    end
  end

  defp isosceles?(a, b ,c) do
    if (a == b) || (a == c) || (b == c), do: true
  end

  defp pythagorean(a, b, c) do
    a2 = :math.pow(a, 2) |> round
    b2 = :math.pow(b, 2) |> round
    c2 = :math.pow(c, 2) |> round
    if (a2 + b2) == c2, do: true
  end

  defp hypotenuse(a, b, c) do
    biggest(a, b) |> biggest(c)
  end

  defp biggest(a, b) do
    if a > b, do: a, else: b
  end
end
