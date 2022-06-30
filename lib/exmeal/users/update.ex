defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, User, Repo}
  alias Exmeal.Users.Get

  def call(%{"id" => id} = params) do
    id
    |> Get.by_id()
    |> do_update(params)
  end

  defp do_update({:error, _reason} = result, _params), do: result

  defp do_update({:ok, %User{} = user}, params) do
    update_response =
      user
      |> User.changeset(params)
      |> Repo.update()

    case update_response do
      {:ok, %User{}} = result ->
        result

      {:error, reason} ->
        reason
        |> Error.build_bad_request()
        |> Error.wrap()
    end
  end
end
