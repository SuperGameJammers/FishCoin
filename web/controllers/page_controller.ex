defmodule FishCoin.PageController do
  use FishCoin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
