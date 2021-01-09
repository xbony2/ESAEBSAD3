# ESAEBSAD3
A Discord bot used by the Official FTB Wiki (mostly me) to accomplish various automated tasks. Currently a work-in-progress!

## E-say-bee-what?
ESAEBSAD pronounced /i.ˈseɪ.bi.sæd.tu/ (e-say-b-sad-two). It stands for **E**xperimental **S**elf **A**ware **E**lectronic **B**ased **S**pace **A**nalyzing **D**roid [in the] **2**nd-Dimension. Unfortunately, because the bot is stuck in the second dimension, it can't analyze space very well, so instead it just does random tasks that I want it to. Mostly this is just find-replace operations and things like that.

## Setup
A [Discord application token](https://discordapp.com/developers/applications) should already be generated, and a [bot login and password](https://ftb.gamepedia.com/Special:BotPasswords) should be generated (assuming you are using Gamepedia; otherwise, it's probably just the username and password for the wikiLogin and wikiToken).

A `config.toml` file must be created with the properties listed in `example_config.toml`. Note the following:
* The `wiki-login` property is the wiki bot's login, which is ***not*** the same as the bot's username on Gamepedia. This is viewable on [Special:BotPasswords](https://ftb.gamepedia.com/Special:BotPasswords).
* The `wiki-token` property is the wiki bot's token, as generated by [Special:BotPasswords](https://ftb.gamepedia.com/Special:BotPasswords). Note when generated, it cannot be viewed again, so make sure to put it in the properties file before it is lost. If forgotten, a new bot password can be created, but then you have to update everything.
* The `discord-token` property is the Discord bot account's token, which can be found on [Discord's developer application dashboard](https://discord.com/developers/applications).
* The `discord-client` property is the Discord bot's client ID, which can also be found on Discord's developer application dashboard.

This is a Ruby application, so Ruby should be installed. [Bundler](https://bundler.io) should be installed as well; running `bundle` will install all other dependencies.

## Usage
Just run the command `!help` and it will list all of the commands and how to use them. ezpz.

## Dependencies
Here are the core dependencies of ESAEBSAD3:
* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](https://bundler.io)
* [discordrb](https://github.com/shardlab/discordrb)
* [MediaWiki::Butt](https://github.com/FTB-Gamepedia/MediaWiki-Butt-Ruby)

Other dependencies are listed in the `Gemfile`. Again, Bundler takes care of all of these.

## Earlier bots
* [ESAEBSAD (1)](https://github.com/xbony2/Experimental-Self-Aware-Electronic-Based-Space-Analyzing-Droid)
* [ESAEBSAD2](https://github.com/xbony2/ESAEBSAD2)
