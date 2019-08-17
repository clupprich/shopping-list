defmodule ShoppingList.ListsTest do
  use ShoppingList.DataCase

  alias ShoppingList.Lists

  describe "lists" do
    alias ShoppingList.Lists.List

    @valid_attrs %{token: "some token", name: "some name"}
    @update_attrs %{token: "some updated token", name: "some updated name"}
    @invalid_attrs %{token: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list()

      list
    end

    test "get_list!/1 returns the list with given token" do
      list = list_fixture()
      assert Lists.get_list!(list.token) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Lists.create_list(@valid_attrs)
      assert list.token == "some token"
      assert list.name == "some name"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Lists.update_list(list, @update_attrs)
      assert list.name == "some updated name"
    end

    test "update_list/2 ignores the token" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Lists.update_list(list, @update_attrs)
      assert list.token == "some token"
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Lists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list!(list.token) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Lists.change_list(list)
    end
  end
end
