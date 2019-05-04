defmodule UnicafeMicroservice do
  use Application

  def start(_type, _args) do
    app_port_s = System.get_env "PORT"
    app_port = Integer.parse app_port_s
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: UnicafeRouter, options: [port: app_port])
    ]

    opts = [strategy: :one_for_one, name: UnicafeMicroservice.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
