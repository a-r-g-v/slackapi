defmodule SlackAPI.API.Emoji do
  import SlackAPI.API.Base

  def list() do
    "/emoji.list" |> add_token |> process_get |> process_decode(%SlackAPI.Model.APITest{})
  end
end
