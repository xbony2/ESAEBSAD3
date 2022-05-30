module ESAEBSAD3
	module Wiki
		def self.new_group_id
			last_group_id = BOT_DB.exec(%(SELECT MAX(groupid) FROM actions;)).getvalue(0, 0)
			last_group_id = last_group_id.nil? ? 0 : last_group_id.to_i

			last_group_id + 1
		end

		def self.edit(command, title, text, opts = {})
			edit_with_group(new_group_id, command, title, text, opts)
		end

		def self.edit_with_group(group_id, command, title, text, opts = {})
			before_text = WIKI.get_text(title)

			id = BOT_DB.exec_params(%(INSERT INTO actions(groupid, command, wikitext_before, wikitext_after, type, complete) VALUES($1, $2::text, $3::text, $4::text, 'edit', false) RETURNING id;), [group_id, command, before_text, text]).getvalue(0, 0)

			WIKI.edit(title, text, opts)

			BOT_DB.exec_params(%(UPDATE actions SET complete = true WHERE id = $1), [id])
		end

		def self.create_page(command, title, text, opts = {})
			create_page_with_group(new_group_id, command, title, text, opts)
		end

		def self.create_page_with_group(group_id, command, title, text, opts = {})
			id = BOT_DB.exec_params(%(INSERT INTO actions(groupid, command, wikitext_after, type, complete) VALUES($1, $2::text, $3::text, 'create', false) RETURNING id;), [group_id, command, text]).getvalue(0, 0)

			WIKI.edit(title, text, opts)

			BOT_DB.create_page(%(UPDATE actions SET complete = true WHERE id = $1), [id])
		end
	end
end
