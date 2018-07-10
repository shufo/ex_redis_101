defmodule ExRedis101 do
  @moduledoc """
  Documentation for ExRedis101.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExRedis101.hello
      :world

  """
  def hello do
    :world
  end

  def set(conn, key, val) do
    Redix.command(conn, ["SET", key, val])
  end

  def get(conn, key) do
    Redix.command!(conn, ["GET", key])
  end
end

defmodule ExRedis101.User do
  def get_username_by_user_id(conn, id) do
    to_string(Redix.command!(conn, ["HVALS", "user:#{id}"]))
  end

  def next_user_id(conn) do
    Redix.command!(conn, ["INCR","0"])
  end

end


#--Ranking Module--
defmodule ExRedis101.Ranking do
  def get_ranking(conn) do
    Redix.command!(conn, ["ZREVRANGE", "ranking", 0, -1])
  end

end


#--AddWorker Module--
defmodule ExRedis101.AddWorker do
  def perform(result_key, first, second) do
    {:ok, conn} = Redix.start_link()
    Redix.command!(conn, ["SET", result_key, first + second])
  end
end
