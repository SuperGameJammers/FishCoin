defmodule FishCoin.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :photo, :string
      add :discount, :string
      add :price, :string

      timestamps
    end

  end
end
