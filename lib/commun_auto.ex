defmodule CommunAuto do
  @moduledoc """
  Entrypoint for `CommunAuto` charging
  """

  import Plan

  require Logger

  def calculate() do
    {time, distance, time_rate, km_rate} = user_inputs()
    rate = %Rate{time_rate: time_rate, km_rate: km_rate}

    Logger.debug(
      "Calcluating the flex_trip @rate: #{inspect(rate)}, distance #{distance}, time #{
        inspect(time)
      }"
    )

    plan(rate, distance, time)
  end

  def calculate_all() do
    Logger.debug("Producing output for all plans")
    {time, distance} = time_dist()

    for {name, current_plan} <- all_plans() do
      {time_rate, km_rate} = config_plan(current_plan)
      rate = %Rate{time_rate: time_rate, km_rate: km_rate}
      Logger.debug(
        "Calcluating the flex_trip @rate: #{inspect(rate)}, distance #{distance}, time #{
          inspect(time)
        }"
      )
      price = plan(rate, distance, time)
      {name, price}
    end

  end

  defp user_inputs() do
    {minutes, _} = IO.gets("minutes: ") |> Integer.parse()
    {hours, _} = IO.gets("hours: ") |> Integer.parse()
    {days, _} = IO.gets("days: ") |> Integer.parse()
    {distance, _} = IO.gets("distance: ") |> Integer.parse()

    {time_rate, km_rate} = config_plan()
    {format_time(minutes, hours, days), distance, time_rate, km_rate}
  end

  defp time_dist() do
    {minutes, _} = IO.gets("minutes: ") |> Integer.parse()
    {hours, _} = IO.gets("hours: ") |> Integer.parse()
    {days, _} = IO.gets("days: ") |> Integer.parse()
    {distance, _} = IO.gets("distance: ") |> Integer.parse()
    {format_time(minutes, hours, days), distance}
  end

  defp format_time(minutes, hours, days) do
    [minutes: minutes, hours: hours, days: days]
  end
end
