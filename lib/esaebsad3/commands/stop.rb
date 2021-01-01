module ESAEBSAD3
	module Stop
		extend Discordrb::Commands::CommandContainer

		command(:stop, description: "Stops the bot.", permission_level: 1) do |event|
			event.respond "Stopping!"
			exit
		end
	end
end
