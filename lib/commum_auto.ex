defmodule CommumAuto do
  @moduledoc """
  Entrypoint for `CommumAuto` charging
  """

  import Plan

  # TODO create config for rate structres
  @time_rate [minute_rate: 1, hour_rate: 10, day_rate: 100]
  @km_rate [km_change: 100, base_rate: 1, increased_rate: 2]
  @km_include [km_included: 100, increased_rate: 10]

  def round_trip() do
    {time, distance} = user_inputs()

    rate = %Rate{time_rate: @time_rate, km_rate: @km_rate}

    plan(rate, distance, time)
  end

  def flex() do
    {time, distance} = user_inputs()
    rate = %Rate{time_rate: @time_rate, km_rate: @km_include}

    plan(rate, distance, time)
  end

  defp user_inputs() do
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
