defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @displayable_params [
    :user_id,
    :description,
    :date,
    :calories
  ]
  @params @displayable_params
  @derive {Jason.Encoder, only: [:id] ++ @displayable_params}

  schema "meals" do
    belongs_to :user, User

    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
  end

  def changeset(params) do
    %__MODULE__{}
    |> build_changeset(params, @params)
  end

  def changeset(struct, params) do
    struct
    |> build_changeset(params, @params)
  end

  defp build_changeset(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
  end
end
