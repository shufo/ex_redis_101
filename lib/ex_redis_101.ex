defmodule ExRedis101 do

	alias Redix
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

  	def set(conn, key, value) do
    	Redix.command(conn,["SET", key, value])
  	end

  	def get(conn, key) do
    	Redix.command!(conn, ["GET", key])
  	end


  	defmodule User do
    	def get_username_by_user_id(conn, id) do
    	  to_string (Redix.command!(conn, ["HVALS", "user:#{id}"]))
	    end

		def next_user_id (conn) do
    		Redix.command!(conn, ["INCR", 0])
   		end
  	end


	defmodule AddWorker do
		def preform(key, first, second) do
			{:ok, con} = Redix.start_link()
			{:ok, con: conn}
			Redix.command(conn, ["SET", key, first + second])
		end
	end
	

	defmodule Ranking do
		def get_ranking(conn) do
			Redix.command!(conn, ["ZREVRANGE", "ranking", 0, -1])
    	end
  	end
end