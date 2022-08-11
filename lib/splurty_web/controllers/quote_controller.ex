defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  def homeage(conn, _params) do
    render(conn, "homepage.html")
  end

  def index(conn, _params) do
   # render(conn, "index.html")
   conn
    |> assign(:quotes, Splurty.QuoteDb.list_quotes)
    |> render("index.html")
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
