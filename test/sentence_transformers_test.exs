defmodule SentenceTransformersTest do
  import SentenceTransformers
  use ExUnit.Case

  test "encode" do
    {:ok, pid} = start_link()
    embedding = encode(pid, "hello world")
    assert embedding |> is_list()
    assert length(embedding) == 384
    assert Enum.all?(embedding, &is_float/1)
  end
end
