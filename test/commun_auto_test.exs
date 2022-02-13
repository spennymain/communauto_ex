defmodule CommunAutoTest do
  use ExUnit.Case

  import CommunAuto

  test "calculate a trip" do
    price = calculate()
    assert is_number(price)
  end
end
