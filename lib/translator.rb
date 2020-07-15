require "yaml"

def load_library(file)
  yaml_file = YAML.load_file(file)
  {
    "get_meaning"=> yaml_file.map{|k,v| [v[1], k]}.to_h,
    "get_emoticon" => yaml_file.map{|k,v| [v[0], v[1]]}.to_h
  }

end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  emoticons["get_emoticon"].has_key?(emoticon) ? emoticons["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  emoticons["get_meaning"].has_key?(emoticon) ? emoticons["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
