defmodule GroceryWeb.FruitController do

  use GroceryWeb, :controller


  alias Grocery.Repo

  alias Grocery.Fruits.Fruit


  def index(conn, _params) do
    fruits = Repo.all(Fruit)

    render(conn, :index, fruits: fruits)
  end
end
