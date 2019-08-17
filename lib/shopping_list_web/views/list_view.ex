defmodule ShoppingListWeb.ListView do
  use ShoppingListWeb, :view

  def list_name(list) do
    list.name || "A shopping list"
  end
end
