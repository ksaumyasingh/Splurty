defmodule Splurty.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :saying, :string, null: false
      add :author, :string, default: "Anonymous"

      timestamps()
    end

    create unique_index(:quotes, [:saying])
  end
end
