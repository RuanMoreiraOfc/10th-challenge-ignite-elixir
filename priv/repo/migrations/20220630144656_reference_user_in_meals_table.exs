defmodule Exmeal.Repo.Migrations.ReferenceUserInMealsTable do
  use Ecto.Migration

  def change do
    alter table(:meals) do
      add :user_id, references(:users, type: :binary_id)
    end
  end
end
