module ESAEBSAD3
	module Flip
		extend Discordrb::Commands::CommandContainer

		command(:flip, description: "Flips a coin.") do
			flip = rand

			if flip > 0.05
				"The coin flip reveals #{rand > 0.5 ? 'heads' : 'tails'}."
			else
				"The coin lands on its side."
			end
		end
	end
end
