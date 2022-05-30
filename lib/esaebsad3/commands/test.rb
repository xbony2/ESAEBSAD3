module ESAEBSAD3
	module Test
		extend Discordrb::Commands::CommandContainer

		command(:test, description: "Might do anything. Owner only.", permission_level: Permissions::OWNER_PERM) do
			Wiki.edit('test', "User:Xbony2/JustAnotherTest", rand.to_s)

			"Done."
		end
	end
end
