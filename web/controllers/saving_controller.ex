defmodule FishCoin.SavingController do
  use FishCoin.Web, :controller

  alias FishCoin.Saving
  alias FishCoin.Payment

  plug :scrub_params, "saving" when action in [:create, :update]

  def index(conn, _params) do
    savings = Repo.all(Saving)
    render(conn, "index.html", savings: savings)
  end

  def new(conn, _params) do
    changeset = Saving.changeset(%Saving{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"saving" => saving_params}) do
    changeset = Saving.changeset(%Saving{}, saving_params)

    case Repo.insert(changeset) do
      {:ok, _saving} ->
        conn
        |> put_flash(:info, "Saving created successfully.")
        |> redirect(to: saving_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    saving = Repo.get!(Saving, id)
    payments = Repo.all(Payment)
    total = sum(payments)
    render(conn, "show.html", saving: saving, payments: payments, total: total)
  end

  def sum(savings) do
    Enum.map(savings, fn(x) -> x.amount end)
    |> Enum.sum
  end

  def edit(conn, %{"id" => id}) do
    saving = Repo.get!(Saving, id)
    changeset = Saving.changeset(saving)
    render(conn, "edit.html", saving: saving, changeset: changeset)
  end

  def update(conn, %{"id" => id, "saving" => saving_params}) do
    saving = Repo.get!(Saving, id)
    changeset = Saving.changeset(saving, saving_params)

    case Repo.update(changeset) do
      {:ok, saving} ->
        conn
        |> put_flash(:info, "Saving updated successfully.")
        |> redirect(to: saving_path(conn, :show, saving))
      {:error, changeset} ->
        render(conn, "edit.html", saving: saving, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    saving = Repo.get!(Saving, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(saving)

    conn
    |> put_flash(:info, "Saving deleted successfully.")
    |> redirect(to: saving_path(conn, :index))
  end
end
