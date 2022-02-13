import Config

config :communauto_ex,
  open_flex: [minute_rate: 0.40, hour_rate: 12, day_rate: 50, km_included: 100, rate: 0.20],
  open_round: [minute_rate: 0, hour_rate: 12, day_rate: 50, km_included: 100, rate: 0.20],
  open_plus_flex: [minute_rate: 0.40, hour_rate: 12, day_rate: 50, km_included: 100, rate: 0.20],
  open_plus_round: [
    minute_rate: 0,
    hour_rate: 6.25,
    day_rate: 50,
    day_rate_additional: 35,
    km_included: 0,
    rate: 0.16
  ]
