defmodule SlackAPI.API.Base do
  use HTTPoison.Base
  @endpoint "https://slack.com/api"

  @auth_token Application.get_env(:bot, :auth_token)
  
  def add_token(url) do
    url <> "?token=#{@auth_token}" 
  end

  def process_get(url) do
    url |> process_url |> HTTPoison.get
  end

  def process_url(url) do 
    @endpoint <> url
  end

  def process_decode({:ok, result}, struct_type) do
    object = ( result.body |> Poison.decode!(keys: :atoms) )
    struct(struct_type, object)
  end

  def process_decode({:error, result}, _struct) do
    IO.inspect result
    System.halt(1)
  end

  def concat_options(url, options) do
    args = parse_options(options)
    if String.contains? url, "?" do
      url <> "&" <> args
    else
      url <> "?" <> args
    end
  end

  def parse_options(options) do
    Enum.map(options, fn {k, v} -> List.to_string(k) <> "=" <> List.to_string(v) end)
    |> Enum.join "&"
  end

end
