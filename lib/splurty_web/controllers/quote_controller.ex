defmodule SplurtyWeb.QuoteController do
  use SplurtyWeb, :controller

  def homeage(conn, _params) do
    render(conn, "homepage.html")
  end
end
