require "pry"
require "yaml"

# require modules here


def load_library(path)
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons = YAML.load_file(path)
  mean = emoticons.keys
  eng = []
  jap = []
  emoticons.values.collect do |x| 
    x = x[0] 
    eng << x
  end
  emoticons.values.collect do |y| 
    y = y[1] 
    jap << y
  end
  
  j_m = {}
  e_j = {}
  i = 0 
  while i < jap.length
    j_m[jap[i]] = mean[i]
    e_j[eng[i]] = jap[i]
    i += 1
  end
  
  hash["get_meaning"] = j_m
  hash["get_emoticon"] = e_j
  hash
end

def get_japanese_emoticon(path, emoticon)
  # binding.pry
  emo_hash = load_library(path)
  if emo_hash["get_emoticon"].include?(emoticon)
    emo_hash.each do |type, k|
      emo_hash[type].each do |k, v|
        if emoticon == k
          return v # you have to return to stop the loop! Otherwise it prints everything
        end
      end
    end
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emo_hash = load_library(path)
  if emo_hash["get_meaning"].include?(emoticon)
    emo_hash.each do |type, k|
      emo_hash[type].each do |k, v|
        if emoticon == k
          return v # you have to return to stop the loop! Otherwise it prints everything
        end
      end
    end
  else
    return "Sorry, that emoticon was not found"
  end
end
