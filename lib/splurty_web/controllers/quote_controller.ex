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

  def show(conn , %{"id" => id}) do
    quote_by_id= QuoteDb.get_quote!(id)
    render(conn, "show.html", quote_by_id: quote_by_id)
  end

  def edit(conn , %{"id" => id}) do
    quote_by_id = QuoteDb.get_quote!(id)
    changeset = QuoteDb.change_quote(quote_by_id)
    render(conn, "edit.html", quote: quote_by_id, changeset: changeset)
  end

  def update(conn ,%{"id" => id, "quote" => quote_params}) do
    quote_by_id= QuoteDb.get_quote!(id)
    case QuoteDb.update_quote(quote_by_id, quote_params) do
      {:ok, _quote} ->
        conn
        |> put_flash(:info, "Quote updated successfully")
        |> redirect(to: Routes.quote_path(conn, :show, quote_by_id))
      {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html",quote: quote_by_id, changeset: changeset)
    end
  end

  def delete(conn , %{"id" => id}) do
    quote_by_id= QuoteDb.get_quote!(id)
    {:ok, _quote} = QuoteDb.delete_quote(quote_by_id)
    conn
    |> put_flash(:info, "Quote deleted successfully")
    |> redirect(to: Routes.quote_path(conn, :index))
  end
end
