defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Meal, Repo}

  def call(params) do
    insertion_response =
      params
      |> Meal.changeset()
      |> Repo.insert()

    case insertion_response do
      {:ok, %Meal{}} = result ->
        result

      {:error, reason} ->
        reason
        |> Error.build_bad_request()
        |> Error.wrap()
    end
  end
end
