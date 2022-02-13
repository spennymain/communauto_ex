defmodule Plan do
  @moduledoc """
  Functions and structs associated with the different communauto plans
  """

  import Rate

  require Logger

  def plan(
        %Rate{time_rate: time_rate, km_rate: [_km_included, _rate] = km_rate},
        distance,
        time
      ) do
    time_cost(time_rate, time) + distance_cost(km_rate[:km_included], distance, km_rate[:rate])
  end

  def plan(
        %Rate{time_rate: time_rate, km_rate: [_km_change, _base_rate, _increased_rate] = km_rate},
        distance,
        time
      ) do
    time_cost(time_rate, time) + distance_cost(km_rate, distance)
  end

  def config_plan() do
    get_plan() |> format_plan
  end

  defp get_plan() do
    {num, _} = IO.gets("plan (num):\n1: open_flex\n2: open_round\n") |> Integer.parse()

    case num do
      1 -> Application.fetch_env!(:communauto_ex, :open_flex)
      2 -> Application.fetch_env!(:communauto_ex, :open_round)
    end
  end

  defp format_plan([minute, hour, day, km_included, increased_rate]) do
    {[minute, hour, day], [km_included, increased_rate]}
  end
end
