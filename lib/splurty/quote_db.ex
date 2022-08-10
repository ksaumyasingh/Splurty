defmodule Splurty.QuoteDb do
  import Ecto.Query, warn: false
  alias Splurty.QuoteDb.Quote
  alias Splurty.Repo

  def list_quotes do
    #Repo.all(from q in "quotes", select: q.saying)
    Repo.all(Quote)
  end

  def create_quotes(attrs \\ %{}) do
    %Quote{}
    |> Quote.changeset(attrs)
    |> Repo.insert()
  end

  def get_quote!(id) do
     Repo.get!(Quote, id)
  end

  def update_quote(%Quote{} = quote, attrs) do
    quote
    |> Quote.changeset(attrs)
    |> Repo.update()
  end
end
