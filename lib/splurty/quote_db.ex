defmodule Splurty.QuoteDb do
  import Ecto.Query, warn: false
  alias Splurty.QuoteDb.Quote
  alias Splurty.Repo
  # for ecto queries
  #https://hexdocs.pm/ecto/Ecto.Query.html
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
     #Repo.all(from q in "quotes",where: q.id == ^id, select: {q.saying, q.author})
  end

  def update_quote(%Quote{} = quote, attrs) do
    quote
    |> Quote.changeset(attrs)
    |> Repo.update()
  end

  def change_quote(%Quote{} = q) do
    q
    |> Quote.changeset()
  end

  def delete_quote(%Quote{} = id) do
    Repo.delete(id)
  end

  def random_quote do
    query =
      from t in Quote,
      where: is_nil(t.id),
      order_by: fragment("RANDOM()"),
      limit: 10
    IO.puts(query)
    Repo.one!(query)
  end
end
