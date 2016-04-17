defmodule FishCoin.ProductView do
  use FishCoin.Web, :view

  def discounted(price, discount) do
    price = String.to_integer(price)
    discount = String.to_integer(discount)
    x = round(price/100) * discount
    price - x
  end
end
