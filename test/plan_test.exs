defmodule PlanTest do
  use ExUnit.Case, async: true

  import Plan

  test "plan rate" do
    assert is_integer(plan(10, 80, [1, 2, 3, 4]))
  end

  test "time cost" do
    assert is_integer(time_cost(1, 2, 3, 1, 2, 3))
  end

  test "distance cost" do
    assert 2.0 = distance_cost(110, 100, 0.20)
  end
end
