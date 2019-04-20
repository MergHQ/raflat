defmodule UnicafeMicroservice do
  require UnicafeService
  require UnicafeRouter

  def init(default_options) do
    IO.puts "Starting server..."
    HTTPoison.start
    default_options
  end

  def call(conn, options) do
    UnicafeRouter.call(conn, UnicafeRouter.init([]))
  end
end

Plug.Adapters.Cowboy.http UnicafeRouter, []