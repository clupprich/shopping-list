defmodule ShoppingListWeb.PageControllerTest do
  use ShoppingListWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to your Shopping List!"
  end
end
