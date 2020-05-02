defmodule Urlshorten do

  def main(args) do
    {_, argv, _} = OptionParser.parse args

    hash = List.first(argv)
      |> create_short()
      |> get_smaller_hash(12)

    url = "http://this.site.com/" <> hash
    insp url
  end

  defp create_short(url) do
    :crypto.hash(:md5, url) |> Base.encode16 case: :lower 
  end

  defp get_smaller_hash(hash, size) do
    List.first Tuple.to_list String.split_at hash, size
  end

  defp insp(stream) do
    IO.inspect stream
  end

end
