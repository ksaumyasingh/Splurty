defmodule Splurty.QuoteDb.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :saying, :string
    field :author, :string
    timestamps()
  end

  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:saying, :author])
    |> validate_required([:saying])
  end
end
