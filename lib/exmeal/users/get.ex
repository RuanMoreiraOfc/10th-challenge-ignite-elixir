defmodule Exmeal.Users.Get do
  alias Exmeal.{Error, User, Repo}

  def by_id(id) do
    case Repo.get(User, id) do
      %User{} = user ->
        {:ok, user}

      nil ->
        Error.build_user_not_found_error()
        |> Error.wrap()
    end
  end
end
