defmodule Rate do
  @moduledoc """
  Functions for calculating the charged rate of trips based on a supplied plan
  """

  require Logger

  defstruct [:time_rate, :km_rate]
  @type time_rate :: [minute_rate: integer, hour_rate: integer, day_rate: integer]
  @type km_rate :: [km_change: integer, base_rate: integer, increased_rate: integer]
  @type time :: [minutes: integer, hours: integer, days: integer]

  @spec time_cost(time_rate, time) :: integer
  def time_cost(time_rate, time) do
    time_rate[:minute_rate] * time[:minutes] + time_rate[:hour_rate] * time[:hours] +
      time_rate[:day_rate] * time[:days]
  end

  @spec distance_cost(km_rate :: km_rate, integer) :: integer
  def distance_cost(km_rate, distance) do
    km_rate[:km_change] * km_rate[:base_rate] +
      km_rate[:increased_rate] * (distance - km_rate[:km_change])
  end

  @spec distance_cost(integer, integer, integer) :: integer
  def distance_cost(km_included, distance, rate) do
    Logger.debug("#{km_included}, #{distance}, #{rate}")
    (distance - km_included) * rate
  end
end
