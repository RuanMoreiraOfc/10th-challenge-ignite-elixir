defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  alias Exmeal.Meal

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
