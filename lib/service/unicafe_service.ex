defmodule UnicafeService do  
  def fetch_foodlist(rest_id) do
    %HTTPoison.Response{ body: body } = HTTPoison.get!(get_url(rest_id))
    parsed_data = format_foodlist_resp body
    %{restaurant: get_restaurant(rest_id), foodlist: parsed_data}
  end

  defp format_foodlist_resp(raw_resp) do
    format = fn item ->
      formated_fooditems = Enum.map(item["data"], &(%{name: &1["name"], price: &1["price"], meta: &1["meta"]}))
      %{date: item["date"], food_items: formated_fooditems}      
    end
    
    data = Poison.decode!(raw_resp)["data"]
    Enum.map(data, format)
  end

  defp get_url(rest_id) do
    "https://messi.hyyravintolat.fi/publicapi/restaurant/" <> rest_id
  end

  defp get_restaurant(rest_id) do
    %HTTPoison.Response{ body: body } = HTTPoison.get!("https://messi.hyyravintolat.fi/publicapi/restaurants/")
    data = Poison.decode!(body)["data"]
    {n_rest_id, err} = Integer.parse(rest_id)
    Enum.find(data, &(&1["id"] === n_rest_id))
  end
end