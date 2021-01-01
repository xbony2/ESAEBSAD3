require 'discordrb'
require 'mediawiki-butt'
require 'require_all'
require 'tomlrb'

require_rel 'commands'

module ESAEBSAD3
	CONFIG = Tomlrb.load_file('config.toml').freeze

	BOT = Discordrb::Commands::CommandBot.new(token: CONFIG['discord-token'], client_id: CONFIG['discord-client'], prefix: CONFIG['discord-prefix'])

	COMMANDS = [
		ESAEBSAD3::Ping
	]

	COMMANDS.each {|c| BOT.include! c}

	def self.run
		BOT.run
	end
end
