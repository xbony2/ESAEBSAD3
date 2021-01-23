module ESAEBSAD3
	module ArticleOfTheWeek
		extend Discordrb::Commands::CommandContainer

		command(:article_of_the_week, description: "Gives the article of the week using an extremely advanced algorithm.") do
			page = WIKI.get_random_pages[0]

			# TODO: switch to MediaWiki::Utils.encode_url
			"The article of the week is... #{page}! <https://ftb.gamepedia.com/#{page.tr(' ', '_').gsub("'", '%27')}>"
		end
	end
end
