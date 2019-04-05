require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './album.rb'

#album_list_url = https://pitchfork.com/reviews/best/albums/

class Scraper

  def self.scrape_pitchfork(index_url)
      index = Nokogiri::HTML(open(index_url))
      binding.pry
  end

  def self.newest_album(index_url)
    new_album = scrape_pitchfork(index_url).css(".fragment-list").css(".review")[0]
    #artist_name = new_album.css("li")[0].text
    #genre = new_album.css("li")[1].text
    #review_url = new_album.css("a").attr("href").value
    #album_title = new_album.css(".review__title-album").text

  end

  def self.album_list(index_url)
    a_list = scrape_pitchfork(index_url).css(".fragment-list").css(".review")
    #a_list.collect {|a| a.text}
    #artist_name = new_album.css("li")[0].text
    #genre = new_album.css("li")[1].text
    #review_url = new_album.css("a").attr("href").value
    #album_title = new_album.css(".review__title-album").text
  end

  def self.album_score(index_url)
    score = scrape_pitchfork(index_url).css(".score").text.to_f
  end

end

Scraper.scrape_pitchfork('https://pitchfork.com/reviews/albums/weyes-blood-titanic-rising/')
