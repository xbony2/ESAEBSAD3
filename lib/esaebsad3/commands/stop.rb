module ESAEBSAD3
	module Stop
		extend Discordrb::Commands::CommandContainer

		command(:stop, description: "Stops the bot.") do
			exit
		end
	end
end
