defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller

  alias Exmeal.User
  alias ExmealWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmeal.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Exmeal.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show() do
    # TO DO
  end

  def update() do
    # TO DO
  end
end
