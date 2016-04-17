defmodule FishCoin.Repo.Migrations.CreateSaving do
  use Ecto.Migration

  def change do
    create table(:savings) do
      add :due_date, :string
      add :amount_to_raise, :integer
      add :name, :string
      add :photo, :string

      timestamps
    end

  end
end
