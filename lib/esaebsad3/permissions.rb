module ESAEBSAD3
	module Permissions
		EVERYONE_PERM = 0
		EDITOR_PERM = 1
		MODERATOR_PERM = 2
		OWNER_PERM = 3

		# Excluding @ everyone here as no permission is needed for it.
		ROLE_NAME_TO_PERM = {
			"Editor" => EDITOR_PERM,
			"Moderator" => MODERATOR_PERM,
			"Discord owner" => OWNER_PERM
		}

		def self.update_permissions
			# ESAEBSAD3 is only in one server so no need to loop through anything.
			BOT.servers.first[1].roles.each do |r|
				BOT.set_role_permission(r.id, ROLE_NAME_TO_PERM[r.name]) if ROLE_NAME_TO_PERM.include? r.name
			end
		end
	end
end
