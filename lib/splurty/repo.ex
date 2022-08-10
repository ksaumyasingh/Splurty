defmodule Splurty.Repo do
  use Ecto.Repo,
    otp_app: :splurty,
    adapter: Ecto.Adapters.Postgres
end
