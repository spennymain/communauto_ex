defmodule PlanTest do
  use ExUnit.Case, async: true

  test "struct creation" do
    daily = %Plan{minute: 0.4, hour: 12, day: 50}
    assert %Plan{} = daily 
  end
end
