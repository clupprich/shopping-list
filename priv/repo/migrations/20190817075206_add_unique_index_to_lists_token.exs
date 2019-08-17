defmodule ShoppingList.Repo.Migrations.AddUniqueIndexToListsToken do
  use Ecto.Migration

  def change do
    create unique_index(:lists, [:token])
  end
end
