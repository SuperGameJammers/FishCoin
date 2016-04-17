defmodule FishCoin.PaymentTest do
  use FishCoin.ModelCase

  alias FishCoin.Payment

  @valid_attrs %{amount: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Payment.changeset(%Payment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Payment.changeset(%Payment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
