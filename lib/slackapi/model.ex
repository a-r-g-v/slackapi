defmodule SlackAPI.Model.AuthTest do
  defstruct ok: nil, url: nil, team: nil, user: nil, team_id: nil, user_id: nil
  @type t :: %__MODULE__{}
end

defmodule SlackAPI.Model.APITest do
  defstruct ok: nil, args: nil
  @type t :: %__MODULE__{}
end
