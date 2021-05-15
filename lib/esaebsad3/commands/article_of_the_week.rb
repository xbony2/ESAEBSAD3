require 'mediawiki/utils'

module ESAEBSAD3
	module ArticleOfTheWeek
		extend Discordrb::Commands::CommandContainer

		command(:article_of_the_week, description: "Gives the article of the week using an extremely advanced algorithm.") do
			page = WIKI.get_random_pages[0]

			"The article of the week is... #{page}! <https://ftb.fandom.com/wiki/#{MediaWiki::Utils.encode_url(page).tr(' ', '_')}>"
		end
	end
end
