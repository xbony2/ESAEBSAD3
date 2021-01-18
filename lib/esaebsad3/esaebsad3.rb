require 'discordrb'
require 'mediawiki-butt'
require 'require_all'
require 'tomlrb'

require_relative 'permissions'

require_rel 'commands'

module ESAEBSAD3
	CONFIG = Tomlrb.load_file('config.toml').freeze

	BOT = Discordrb::Commands::CommandBot.new(token: CONFIG['discord-token'], client_id: CONFIG['discord-client'], prefix: CONFIG['discord-prefix'])

	COMMANDS = [
		ESAEBSAD3::Dev,
		ESAEBSAD3::Flip,
		ESAEBSAD3::Ping,
		ESAEBSAD3::Stop
	]

	COMMANDS.each {|c| BOT.include! c}

	def self.run
		BOT.run(true)

		Permissions.update_permissions
		BOT.game = "with your heart"

		BOT.join
	end
end
