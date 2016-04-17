defmodule FishCoin.Saving do
  use FishCoin.Web, :model

  schema "savings" do
    field :due_date, :string
    field :amount_to_raise, :integer
    field :name, :string
    field :photo, :string

    timestamps
  end

  @required_fields ~w(due_date amount_to_raise name photo)
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
