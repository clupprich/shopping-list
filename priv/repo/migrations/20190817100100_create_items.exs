defmodule ShoppingList.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string, null: false
      add :status, :string, null: false, default: "active"
      add :list_id, references(:lists)

      timestamps()
    end
  end
end
