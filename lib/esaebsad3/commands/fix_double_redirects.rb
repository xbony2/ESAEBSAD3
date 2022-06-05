module ESAEBSAD3
	module FixDoubleRedirects
		extend Discordrb::Commands::CommandContainer

		# If there's a triple redirect, this command won't fully address it, but run it enough times and it'll be good.
		command(:fix_double_redirects, description: "Goes through the double redirects list and attempts to automatically fix them. Editor only.", permission_level: Permissions::EDITOR_PERM) do |event|
			group_id = Wiki.new_group_id

			WIKI.get_doubleredirects_page.each do |redirect|
				text = WIKI.get_text(redirect)

				first_target = text.sub("#REDIRECT [[", "").sub("]]", "")

				if redirect == first_target
					BOT.send_message(event.channel.id, "Warning: #{redirect} appears to be a self-redirect.")
					next
				end

				targets_text = WIKI.get_text(first_target)

				if targets_text.nil? # Dunno if there are many cases where this could happen, but you never know
					BOT.send_message(event.channel.id, "Warning: page #{first_target} does not exist.")
					next
				end

				# [[Special:DoubleRedirects]] is cached and can include entries that have already been solved, so we want to ignore non-redirects
				next unless targets_text.include? "#REDIRECT"

				second_target = targets_text.sub("#REDIRECT [[", "").sub("]]", "")
				Wiki.edit_with_group(group_id, 'fix_double_redirects', redirect, "#REDIRECT [[#{second_target}]]")
			end

			"Done."
		end
	end
end
