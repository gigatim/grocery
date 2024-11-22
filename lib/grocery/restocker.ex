defmodule Grocery.Restocker do

  alias Grocery.Repo
  alias Grocery.Fruits.Fruit

  def fruit(name) do
    # get the fruit by name
    fruit = Repo.get_by(Fruit, name: name)

    # add one to the count
    new_count = fruit.count + 1

    # update the fruit
    changeset = Fruit.changeset(fruit, %{count: new_count})

    Repo.update(changeset)
  end
end
