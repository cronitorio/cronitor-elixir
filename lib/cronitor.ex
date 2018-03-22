defmodule Cronitor do
  @type code :: String.t
  @type auth_key :: String.t
  @type opts :: [auth_key: auth_key]
  @type fail_opts :: [auth_key: auth_key | nil, msg: String.t | nil]

  @spec run(code, opts) :: boolean
  def run(code, opts \\ []) do
    url = get_url(code, "run", nil, opts)
    ping_cronitor(url)
  end

  @spec complete(code, opts) :: boolean
  def complete(code, opts \\ []) do
    url = get_url(code, "complete", nil, opts)
    ping_cronitor(url)
  end

  @spec fail(code, fail_opts) :: boolean
  def fail(code, opts \\ []) do
    url = get_url(code, "fail", nil, opts)
    ping_cronitor(url)
  end

  @spec pause(code, hours :: integer, opts) :: boolean
  def pause(code, hours, opts \\ []) do
    url = get_url(code, "pause", hours, opts)
    ping_cronitor(url)
  end

  @spec get_url(String.t, String.t, any, Keyword.t) :: String.t
  defp get_url(code, action, nil, []) do
    "https://cronitor.link/#{code}/#{action}"
  end

  defp get_url(code, action, param, []) do
    "https://cronitor.link/#{code}/#{action}/#{param}"
  end

  defp get_url(code, action, param, opts) do
    url = get_url(code, action, param, [])
    qs = URI.encode_query(opts)
    url <> "?" <> qs
  end

  @spec ping_cronitor(url :: String.t) :: boolean
  defp ping_cronitor(url) do
    chars = String.to_charlist(url)
    case :httpc.request(chars) do
      {:ok, {{_, 200, _}, _, _}} -> true
      _ -> false
    end
  end
end
