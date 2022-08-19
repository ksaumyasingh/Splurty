# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Splurty.Repo.insert!(%Splurty.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Splurty.QuoteDb

QuoteDb.create_quotes(%{
  saying: "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.",
  author: "James Cameron"
})

QuoteDb.create_quotes(%{
  saying: "The future belongs to those who believe in the beauty of their dreams",
  author: "Eleanor Roosevelt"
})
