module ESAEBSAD3
	module Stop
		extend Discordrb::Commands::CommandContainer

		command(:stop, description: "Stops the bot.", permission_level: MODERATORS) do |event|
			event.respond "Stopping!"
			exit
		end
	end
end
