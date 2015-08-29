defmodule SlackAPI.API.Test do
  
  import SlackAPI.API.Base

  def auth_test() do
    "/auth.test" |> add_token |> process_get |> process_decode(%SlackAPI.Model.AuthTest{})
  end

  def api_test(options \\ %{}) do
    "/api.test" |> concat_options(options) |> process_get |> process_decode(%SlackAPI.Model.APITest{}) 
  end

end
