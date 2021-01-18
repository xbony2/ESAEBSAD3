module ESAEBSAD3
	module Flip
		extend Discordrb::Commands::CommandContainer

		command(:flip, description: "Flips a coin.") do
			"The coin flips reveals #{rand > 0.5 ? "heads" : "tails"}."
		end
	end
end

