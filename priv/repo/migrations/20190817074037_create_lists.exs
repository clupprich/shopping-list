defmodule ShoppingList.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :token, :string

      timestamps()
    end
  end
end
