require 'discordrb'
require 'mediawiki-butt'
require 'require_all'
require 'tomlrb'

require_relative 'permissions'

require_rel 'commands'

module ESAEBSAD3
	puts ENV.keys

	BOT = Discordrb::Commands::CommandBot.new(token: ENV.fetch('DISCORD_TOKEN'), client_id: ENV.fetch('DISCORD_CLIENT'), prefix: ENV.fetch('DISCORD_PREFIX'))

	WIKI = MediaWiki::Butt.new(ENV.fetch('WIKI_URL'), assertion: :bot)
	WIKI.login(ENV.fetch('WIKI_LOGIN'), ENV.fetch('WIKI_TOKEN'))

	COMMANDS = [
		ESAEBSAD3::ArticleOfTheWeek,
		ESAEBSAD3::Dev,
		ESAEBSAD3::Flip,
		ESAEBSAD3::GenLangCats,
		ESAEBSAD3::Ping,
		ESAEBSAD3::Stop
	]

	COMMANDS.each {|c| BOT.include! c}

	def self.run
		BOT.run(true)

		Permissions.update_permissions
		BOT.watching = "!help"

		BOT.join
	end
end
