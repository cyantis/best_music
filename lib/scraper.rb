require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './album.rb'

#album_list_url = https://pitchfork.com/reviews/best/albums/

class Scraper
  def self.scrape_pitchfork(index_url)
      index = Nokogiri::HTML(open(index_url))
  end

  def self.album_list(index_url)
    a_list = scrape_pitchfork(index_url).css(".fragment-list").css(".review")
    a_list.each do |a|
      album = a.css(".review__title-album").text
      artist = a.css("li")[0].text
      genre = a.css("li")[1].text
      url = a.css("a").attr("href").value
      Album.new(album, artist, genre, url)
      Genre.new(genre)
    end
    binding.pry
  end

  def self.album_score
    Album.all.each {|a| a.rating = scrape_pitchfork('https://pitchfork.com#{a.url}').css(".score").text.to_f}
  end

  def self.album_description(index_url)
    description = scrape_pitchfork(index_url).css(".review-detail__abstract").text
  end
end

Scraper.album_list('https://pitchfork.com/reviews/best/albums/')
