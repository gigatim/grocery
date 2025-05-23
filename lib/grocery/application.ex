defmodule Grocery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GroceryWeb.Telemetry,
      Grocery.Repo,
      {DNSCluster, query: Application.get_env(:grocery, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Grocery.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Grocery.Finch},
      # Start a worker by calling: Grocery.Worker.start_link(arg)
      # {Grocery.Worker, arg},
      # Start to serve requests, typically the last entry
      GroceryWeb.Endpoint,
      # Quantum scheduler used to schedule recurring tasks
      Grocery.Scheduler,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Grocery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GroceryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
