defmodule Geoip.Endpoint do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http(__MODULE__, [])
  end

  get "/" do
    send_resp(conn, 200, geo(conn.remote_ip))
  end

  defp geo(remote_ip) do
    country = Geolix.lookup(remote_ip, [where: :mmdb2])
    iso_code = case country do
      nil -> "XX"
      x -> x.country.iso_code
    end
    Poison.encode!(%{country: iso_code})
  end
end