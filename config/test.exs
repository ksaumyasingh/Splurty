import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :splurty, Splurty.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "splurty_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :splurty, SplurtyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tPsFRwruXpCXjNP6JCVUTCbJzehouf8U5a3z/b0qGm0FhdRk/CH7GM6p1ft9q2Y6",
  server: false

# In test we don't send emails.
config :splurty, Splurty.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
