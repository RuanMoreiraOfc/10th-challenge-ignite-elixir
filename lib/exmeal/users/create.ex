defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    insertion_response =
      params
      |> User.changeset()
      |> Repo.insert()

    case insertion_response do
      {:ok, %User{}} = result ->
        result

      {:error, reason} ->
        reason
        |> Error.build_bad_request()
        |> Error.wrap()
    end
  end
end
