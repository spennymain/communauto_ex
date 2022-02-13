defmodule Plan do
  @moduledoc """
  Functions and structs associated with the different communauto plans
  """

  import Rate

  require Logger

  def plan(
        %Rate{time_rate: time_rate, km_rate: [km_included: km_included, increased_rate: rate]},
        distance,
        time
      ) do
    Logger.debug("Processing plan: time: #{inspect(time)}, distance: #{distance}")
    time_cost(time_rate, time) + distance_cost(km_included, distance, rate)
  end

  def plan(%Rate{time_rate: time_rate, km_rate: km_rate}, distance, time) do
    Logger.debug("Processing plan: time: #{inspect(time_rate)}, distance: #{distance}")

    time_cost(time_rate, time) + distance_cost(km_rate, distance)
  end
end
