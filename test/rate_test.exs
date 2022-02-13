defmodule RateTest do
  use ExUnit.Case, async: true

  import Rate

  require Logger

  @distance 110
  @rate 0.50
  @km_included 50
  @time [minutes: 1, hours: 1, days: 1]
  @time_rate [minute_rate: 1, hour_rate: 10, day_rate: 100]
  @km_rate [km_change: 100, base_rate: 1, increased_rate: 2]

  test 'rate time cost' do
    assert 111 = time_cost(@time_rate, @time)
  end

  test 'distance cost' do
    assert 120 = distance_cost(@km_rate, @distance)
  end

  test 'distance cost with included kilometers' do
    assert 30.0 = distance_cost(@km_included, @distance, @rate)
  end
end
