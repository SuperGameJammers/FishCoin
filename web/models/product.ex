defmodule FishCoin.Product do
  use FishCoin.Web, :model

  schema "products" do
    field :name, :string
    field :description, :string
    field :photo, :string
    field :discount, :string
    field :price, :string

    timestamps
  end

  @required_fields ~w(name description photo discount price)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
