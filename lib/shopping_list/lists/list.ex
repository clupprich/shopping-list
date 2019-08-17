defmodule ShoppingList.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :token}

  schema "lists" do
    field :token, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name])
  end

  @doc false
  def create_changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :token])
    |> validate_required([:token])
    |> unique_constraint(:token)
  end
end
