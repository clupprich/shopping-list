defmodule ShoppingListWeb.ListController do
  use ShoppingListWeb, :controller

  alias ShoppingList.Lists
  alias ShoppingList.Lists.List

  def new(conn, _params) do
    list_params = %{token: ShoppingList.Lists.Token.generate(16)}

    case Lists.create_list(list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = _} ->
        conn
        |> put_flash(:error, "Cannot create list.")
        |> redirect(to: Routes.static_path(conn, "/"))
    end
  end

  def create(conn, %{"list" => list_params}) do
    case Lists.create_list(list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = Lists.get_list!(id)
    render(conn, "show.html", list: list)
  end

  def edit(conn, %{"id" => id}) do
    list = Lists.get_list!(id)
    changeset = Lists.change_list(list)
    render(conn, "edit.html", list: list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = Lists.get_list!(id)

    case Lists.update_list(list, list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List updated successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", list: list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = Lists.get_list!(id)
    {:ok, _list} = Lists.delete_list(list)

    conn
    |> put_flash(:info, "List deleted successfully.")
    |> redirect(to: Routes.static_path(conn, "/"))
  end
end
