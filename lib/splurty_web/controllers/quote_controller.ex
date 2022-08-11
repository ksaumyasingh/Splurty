defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller
  alias Splurty.QuoteDb
  alias Splurty.QuoteDb.Quote
  alias Splurty.Repo


  def homeage(conn, _params) do
    render(conn, "homepage.html")
  end

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
   #render(conn, "index.html", quotes: QuoteDb.list_quotes())
   conn
   |> assign(:quotes, QuoteDb.list_quotes)
   |> render("index.html")
  end

  def new(conn, _params) do
    changeset= QuoteDb.change_quote(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_param}) do
    case QuoteDb.create_quotes(quote_param) do
      {:ok, _quote} ->
        conn
        |> put_flash(:info, "Quote created successfully")
        |> redirect(to: Routes.quote_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
