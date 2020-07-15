# require modules here
require "yaml"

def load_library(library)
  # code goes here
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(library)
  emoticons.each do |meaning, emotes|
    new_hash["get_meaning"][emotes[1]] = meaning
    new_hash["get_emoticon"][emotes[0]] = emotes[1]
  end
  new_hash
end

def get_japanese_emoticon(library, emoticon)
  # code goes here
  emote = load_library(library)["get_emoticon"][emoticon]
  emote.nil? ? "Sorry, that emoticon was not found" : emote
end

def get_english_meaning(library, emoticon)
  # code goes here
  meaning = load_library(library)["get_meaning"][emoticon]
  meaning.nil? ? "Sorry, that emoticon was not found" : meaning
end
