defmodule ShoppingList.Lists.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :status, :string

    belongs_to :list, ShoppingList.Lists.List

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :status])
    |> validate_required([:name])
  end
end
