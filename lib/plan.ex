defmodule Plan do
  require Logger

  @moduledoc """
  Functions and structs associated with the different communauto plans
  """
  def plan(time, distance, rate_structure) do
    Logger.debug("Processing plan: #{time}, #{distance}, #{inspect(rate_structure)}")

    time_cost(1,1,1,1,1,1) * distance_cost(1,1,1)
  end

  def time_cost(days, hours, minutes, hour_rate, minute_rate, day_rate) do
    days * day_rate + hours * hour_rate + minutes * minute_rate
  end

  def distance_cost(distance, kms_included, rate_extra) do
    (distance - kms_included) * rate_extra
  end

  def distance_cost(distance, _rate, _rate_extra, km_change) do
    distance - km_change
  end
end
