defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Meal, Repo}
  alias Exmeal.Meals.Get

  def call(id) do
    case Get.by_id(id) do
      {:ok, %Meal{} = meal} ->
        Repo.delete(meal)

      {:error, _reason} = result ->
        result
    end
  end
end
