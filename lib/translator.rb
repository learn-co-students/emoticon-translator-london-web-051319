require "yaml"
require "pry"

def load_library(filepath)
	emoticons = YAML.load_file(filepath)
	emoticons_new_hash = {
		"get_meaning" => {},
		"get_emoticon" => {}
	}

	emoticons.each do |meaning, emoticon|
		west_emoji = emoticon[0]
		jap_emoji = emoticon[1]

		emoticons_new_hash["get_meaning"][jap_emoji] = meaning 
		#adds the meaning of each emoticon to a hash with jap_emoji as key
		emoticons_new_hash["get_emoticon"][west_emoji] = jap_emoji
		#adds the jap_emoji value to each west_emoji key
	end
	emoticons_new_hash
end

def get_japanese_emoticon(filepath, west_emoticon)
	emo_library = load_library(filepath)
	jap_emoji = emo_library["get_emoticon"][west_emoticon]
	
	jap_emoji ? jap_emoji : "Sorry, that emoticon was not found"
	#if jap_emoji returns true, return jap_emoji. else...
	
end

def get_english_meaning(filepath, jap_emoticon)
	emo_library = load_library(filepath)
	eng_meaning = emo_library["get_meaning"][jap_emoticon]
	eng_meaning ? eng_meaning : "Sorry, that emoticon was not found"
end