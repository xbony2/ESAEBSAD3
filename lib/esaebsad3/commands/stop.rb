require_relative '../permissions'

module ESAEBSAD3
	module Stop
		extend Discordrb::Commands::CommandContainer

		command(:stop, description: "Stops ESAEBSAD3. Moderator only.", permission_level: Permissions::MODERATOR_PERM) do |event|
			event.respond "Stopping!"
			BOT.stop
			exit
		end
	end
end
