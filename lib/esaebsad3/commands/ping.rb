module ESAEBSAD3
	module Ping
		extend Discordrb::Commands::CommandContainer

		command(:ping, description: "Gives a test message from the bot.") do
			"Pong!"
		end
	end
end
