defmodule FishCoin.Repo.Migrations.CreatePayment do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :integer

      timestamps
    end

  end
end
