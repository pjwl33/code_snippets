require 'httparty'
require 'json'

module OMDB
  def self.movie_by_id(imdb_id)
    raw_response = HTTParty.get('http://omdbapi.com/?i=' + imdb_id)
    parsed_response  = JSON.parse(raw_response)
    puts parsed_response
  end

  def self.movie_by_title(title)
    raw_response = HTTParty.get('http://omdbapi.com/?t=' + title.gsub("\s", "+"))
    parsed_response  = JSON.parse(raw_response)
    puts parsed_response
  end

  def self.search(query)
    raw_response = HTTParty.get('http://omdbapi.com/?s=' + query.gsub("\s", "+"))
    parsed_response  = JSON.parse(raw_response)
    # response = parsed_response["Search"]
    puts parsed_response
  end
end
