module ESAEBSAD3
	module Wiki
		def self.edit(title, text, opts = {})
			before_text = WIKI.get_text(title)

			# wip: experimenting directly with the DB rn before doing shit in ruby -bony
			last_group_id = BOT_DB.exec('SELECT')

			# BOT_DB.exec_params('INSERT INTO actions() VALUES()')

			WIKI.edit(title, text, opts)

			puts "did an edit!"
		end
	end
end
