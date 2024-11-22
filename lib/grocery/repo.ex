defmodule Grocery.Repo do
  use Ecto.Repo,
    otp_app: :grocery,
    adapter: Ecto.Adapters.Postgres
end
