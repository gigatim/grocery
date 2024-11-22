defmodule Grocery.Fruits.Fruit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fruits" do
    field :count, :integer
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fruit, attrs) do
    fruit
    |> cast(attrs, [:name, :count])
    |> validate_required([:name, :count])
  end
end
