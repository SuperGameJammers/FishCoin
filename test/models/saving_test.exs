defmodule FishCoin.SavingTest do
  use FishCoin.ModelCase

  alias FishCoin.Saving

  @valid_attrs %{amount_to_raise: 42, due_date: "some content", name: "some content", photo: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Saving.changeset(%Saving{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Saving.changeset(%Saving{}, @invalid_attrs)
    refute changeset.valid?
  end
end
