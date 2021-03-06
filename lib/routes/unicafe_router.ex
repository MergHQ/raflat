defmodule UnicafeRouter do
  use Plug.Router
  require UnicafeService

  plug :match
  plug :dispatch

  get "/api/foodlists/:restaurant_id" do
    foodlist = UnicafeService.fetch_foodlist restaurant_id
    output = Poison.encode! foodlist
    send_resp(conn, 200, output)
  end
end