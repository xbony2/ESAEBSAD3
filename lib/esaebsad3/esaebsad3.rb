require 'discordrb'
require 'mediawiki-butt'
require 'pg'
require 'require_all'

require_relative 'permissions'
require_relative 'wiki'

require_rel 'commands'

module ESAEBSAD3
	BOT = Discordrb::Commands::CommandBot.new(token: ENV.fetch('DISCORD_TOKEN'), client_id: ENV.fetch('DISCORD_CLIENT'), prefix: ENV.fetch('DISCORD_PREFIX'))

	WIKI = MediaWiki::Butt.new(ENV.fetch('WIKI_URL'), assertion: :bot)
	WIKI.login(ENV.fetch('WIKI_LOGIN'), ENV.fetch('WIKI_TOKEN'))

	BOT_DB = Env.key?('DATABASE_URL') ? PG.connect(ENV.fetch('DATABASE_URL')) : PG.connect(ENV.fetch('DB_HOST'), ENV.fetch('DB_PORT').to_i, nil, nil, ENV.fetch('DB_NAME'), ENV.fetch('DB_USER'), ENV.fetch('DB_PASSWORD'))
	BOT_DB.type_map_for_results = PG::BasicTypeMapForResults.new(BOT_DB)

	COMMANDS = [
		ESAEBSAD3::ArticleOfTheWeek,
		ESAEBSAD3::Dev,
		ESAEBSAD3::Flip,
		ESAEBSAD3::GenLangCats,
		ESAEBSAD3::ListActions,
		ESAEBSAD3::Ping,
		ESAEBSAD3::Stop,
		ESAEBSAD3::Test
	]

	COMMANDS.each {|c| BOT.include! c}

	def self.run
		BOT.run(true)

		Permissions.update_permissions
		BOT.watching = "!help"

		BOT.join
	end
end
