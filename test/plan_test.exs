defmodule PlanTest do
  use ExUnit.Case, async: true

  import Plan

  @distance 110
  @time [minutes: 1, hours: 1, days: 1]
  @time_rate [minute_rate: 1, hour_rate: 10, day_rate: 100]
  @km_rate [km_change: 100, base_rate: 1, increased_rate: 2]
  @km_include [km_included: 50, increased_rate: 0.50]

  @round_trip %Rate{time_rate: @time_rate, km_rate: @km_rate}
  @flex_trip %Rate{time_rate: @time_rate, km_rate: @km_include}

  test "plan rate flex" do
    assert 141.0 = plan(@flex_trip, @distance, @time)
  end

  test "plan rate round trip" do
    assert 231 = plan(@round_trip, @distance, @time)
  end
end
