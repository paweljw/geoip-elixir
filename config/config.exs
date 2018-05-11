# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :geolix,
  databases: [
    %{
      id: :mmdb2,
      adapter: Geolix.Adapter.MMDB2,
      source: "./vendor/geolite2-country/GeoLite2-Country.mmdb"
    }
  ]
