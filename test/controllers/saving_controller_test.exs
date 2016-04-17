defmodule FishCoin.SavingControllerTest do
  use FishCoin.ConnCase

  alias FishCoin.Saving
  @valid_attrs %{amount_to_raise: 42, due_date: "some content", name: "some content", photo: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, saving_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing savings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, saving_path(conn, :new)
    assert html_response(conn, 200) =~ "New saving"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, saving_path(conn, :create), saving: @valid_attrs
    assert redirected_to(conn) == saving_path(conn, :index)
    assert Repo.get_by(Saving, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, saving_path(conn, :create), saving: @invalid_attrs
    assert html_response(conn, 200) =~ "New saving"
  end

  test "shows chosen resource", %{conn: conn} do
    saving = Repo.insert! %Saving{}
    conn = get conn, saving_path(conn, :show, saving)
    assert html_response(conn, 200) =~ "Show saving"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, saving_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    saving = Repo.insert! %Saving{}
    conn = get conn, saving_path(conn, :edit, saving)
    assert html_response(conn, 200) =~ "Edit saving"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    saving = Repo.insert! %Saving{}
    conn = put conn, saving_path(conn, :update, saving), saving: @valid_attrs
    assert redirected_to(conn) == saving_path(conn, :show, saving)
    assert Repo.get_by(Saving, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    saving = Repo.insert! %Saving{}
    conn = put conn, saving_path(conn, :update, saving), saving: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit saving"
  end

  test "deletes chosen resource", %{conn: conn} do
    saving = Repo.insert! %Saving{}
    conn = delete conn, saving_path(conn, :delete, saving)
    assert redirected_to(conn) == saving_path(conn, :index)
    refute Repo.get(Saving, saving.id)
  end
end
