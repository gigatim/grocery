defmodule Grocery.Repo.Migrations.CreateFruits do
  use Ecto.Migration

  def change do
    create table(:fruits) do
      add :name, :string, null: false, size: 64
      add :count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
