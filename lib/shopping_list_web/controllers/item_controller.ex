defmodule ShoppingListWeb.ItemController do
  use ShoppingListWeb, :controller

  alias ShoppingList.Lists

  def action(conn, _) do
    list = Lists.get_list!(conn.params["list_id"])
    args = [conn, conn.params, list]
    apply(__MODULE__, action_name(conn), args)
  end

  def create(conn, %{"item" => item_params}, list) do
    case Lists.create_item(list, item_params) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = _} ->
        conn
        |> put_flash(:error, "Failed to create item..")
        |> redirect(to: Routes.list_path(conn, :show, list))
    end
  end
end
