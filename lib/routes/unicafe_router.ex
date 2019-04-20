defmodule UnicafeRouter do
  use Plug.Router
  require UnicafeService

  plug :match
  plug :dispatch

  get "/api/foodlists/:restaurant_id" do
    output = Poison.encode!(UnicafeService.fetch_foodlist(restaurant_id))
    send_resp(conn, 200, output)
  end
end