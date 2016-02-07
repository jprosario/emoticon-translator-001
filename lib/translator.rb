require "yaml"
require 'pry'

def load_library(path)
  file = YAML.load_file(path)
  emoticons = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  file.each do |type, info|
    emoticons['get_meaning'][info[1]] = type
    emoticons['get_emoticon'][info[0]] = info[1]
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emo_list = load_library(path)
  jap_emo = 'Sorry, that emoticon was not found'
  emo_list['get_emoticon'].each do |usa, jap|
    if usa == emoticon
      jap_emo = jap
    end
  end
  jap_emo
end

def get_english_meaning(path, emoticon)
  emo_list = load_library(path)
  meaning = 'Sorry, that emoticon was not found'
  emo_list['get_meaning'].each do |jap, type|
    if jap == emoticon
      meaning = type
    end
  end
  meaning
end