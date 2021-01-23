module ESAEBSAD3
	module GenLangCats
		extend Discordrb::Commands::CommandContainer

		CAT_REG = /^Category:(.+)\/(\w{2,3}|\w{2}-\w{1,4})$/

		command(:gen_lang_cats, description: "Generate language-deviation categories based on the wanted categories list. Editor only.", permission_level: Permissions::EDITOR_PERM) do
			WIKI.get_wantedcategories_page.each do |category|
				m = CAT_REG.match(category)

				begin
					WIKI.create_page(category, "[[Category:#{m[1]}]]", summary: "Generated language category.") unless m.nil?
				rescue MediaWiki::Butt::EditError => e
					# The wanted categories page sometimes has cached entries. This is okay, but if there's a different exception, that's a problem.
					throw e if e.message != 'articleexists'
				end
			end

			"Done."
		end
	end
end
