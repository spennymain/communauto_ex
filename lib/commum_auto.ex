defmodule CommumAuto do
  @moduledoc """
  Entrypoint for `CommumAuto` charging
  """

  import Plan

  require Logger

  def round_trip() do
    {time, distance, time_rate, km_rate} = user_inputs()
    rate = %Rate{time_rate: time_rate, km_rate: km_rate}

    Logger.debug("Calcluating the round_trip rate: #{inspect(rate)}")
    plan(rate, distance, time)
  end

  def flex() do
    {time, distance, time_rate, km_rate} = user_inputs()
    rate = %Rate{time_rate: time_rate, km_rate: km_rate}

    Logger.debug("Calcluating the flex_trip rate: #{inspect(rate)}")
    plan(rate, distance, time)
  end

  defp user_inputs() do
    {minutes, _} = IO.gets("minutes: ") |> Integer.parse()
    {hours, _} = IO.gets("hours: ") |> Integer.parse()
    {days, _} = IO.gets("days: ") |> Integer.parse()
    {distance, _} = IO.gets("distance: ") |> Integer.parse()

    {time_rate, km_rate} = config_plan()
    {format_time(minutes, hours, days), distance, time_rate, km_rate}
  end

  defp format_time(minutes, hours, days) do
    [minutes: minutes, hours: hours, days: days]
  end
end
