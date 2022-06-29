defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}
  alias Exmeal.Meals.Get

  def call(%{"id" => id} = params) do
    id
    |> Get.by_id()
    |> do_update(params)
  end

  defp do_update({:error, _reason} = result, _params), do: result

  defp do_update({:ok, %Meal{} = meal}, params) do
    update_response =
      meal
      |> Meal.changeset(params)
      |> Repo.update()

    case update_response do
      {:ok, %Meal{}} = result ->
        result

      {:error, reason} ->
        reason
        |> Error.build_bad_request()
        |> Error.wrap()
    end
  end
end
