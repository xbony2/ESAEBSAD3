module ESAEBSAD3
	module ListActions
		extend Discordrb::Commands::CommandContainer

		command(:list_actions, description: "Lists the last 20 actions.") do
			ret = "```\n"

			BOT_DB.exec(%(SELECT * FROM actions ORDER BY id DESC LIMIT 20;)) do |result|
				result.each do |row|
					ret << "%s %s %s %s %s %s\n" % [ row['id'], row['groupid'], row['command'], row['type'], row['complete'], row['atime'] ]
				end
			end

			ret << "```"

			ret
		end
	end
end
