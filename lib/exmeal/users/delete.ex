defmodule Exmeal.Users.Delete do
  alias Exmeal.{User, Repo}
  alias Exmeal.Users.Get

  def call(id) do
    case Get.by_id(id) do
      {:ok, %User{} = user} ->
        Repo.delete(user)

      {:error, _reason} = result ->
        result
    end
  end
end
