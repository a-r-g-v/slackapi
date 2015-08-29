defmodule SlackAPI.API.Test do
  
  import SlackAPI.API.Base

  def auth_test() do
    "/auth.test" |> add_token |> process_get |> process_decode(%SlackAPI.Model.AuthTest{})
  end

  def api_test(_options \\ []) do
    "/api.test" |> process_get |> process_decode(%SlackAPI.Model.APITest{}) 
  end

end
