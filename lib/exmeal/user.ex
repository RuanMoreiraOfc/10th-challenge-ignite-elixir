defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @displayable_params [
    :name,
    :cpf,
    :email
  ]
  @required_params @displayable_params
  @derive {Jason.Encoder, only: [:id] ++ @displayable_params}

  schema "users" do
    has_many :meals, Meal

    field :name, :string
    field :cpf, :string
    field :email, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> build_changeset(params, @required_params)
  end

  def changeset(struct, params) do
    struct
    |> build_changeset(params, @required_params)
  end

  defp build_changeset(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
  end
end
