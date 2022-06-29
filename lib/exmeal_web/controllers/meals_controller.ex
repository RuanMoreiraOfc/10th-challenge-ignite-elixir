defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias ExmealWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
  end

  def delete(conn, %{"id" => id}) do
  end

  def show(conn, %{"id" => id}) do
  end

  def update(conn, params) do
  end
end
