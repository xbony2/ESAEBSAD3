module ESAEBSAD3
	module ListActions
		extend Discordrb::Commands::CommandContainer

		command(:list_actions, description: "Lists the last 20 actions.") do
			rows = BOT_DB.exec(%(SELECT * FROM actions ORDER BY id DESC LIMIT 20;))

			Wiki.format_rows(rows)
		end
	end
end
