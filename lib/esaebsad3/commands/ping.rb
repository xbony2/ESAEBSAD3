module ESAEBSAD3
	module Ping
		extend Discordrb::Commands::CommandContainer

		command(:ping, description: "Gives a test message.") do
			"Pong!"
		end
	end
end
