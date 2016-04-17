defmodule FishCoin.ProductTest do
  use FishCoin.ModelCase

  alias FishCoin.Product

  @valid_attrs %{description: "some content", discount: "some content", name: "some content", photo: "some content", price: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
