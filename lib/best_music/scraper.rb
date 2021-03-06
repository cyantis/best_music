require_relative '../environment.rb'

class Scraper
  def self.scrape_pitchfork(index_url)
    index = Nokogiri::HTML(open(index_url))
  end

  def self.album_list(index_url)
    a_list = scrape_pitchfork(index_url).css(".fragment-list").css(".review")
    a_list.each do |a|
      album = a.css(".review__title-album").text
      artist = a.css("li")[0].text.gsub("Ã", "ü").gsub("¼", "").gsub("ü©", "é")
      genre = a.css("li")[1].text
      url = a.css("a").attr("href").value
      Genre.new(genre) if !Genre.all.collect {|g| g.name}.include?(genre)
      Album.new(album, artist, genre, url) if !Album.all.collect {|a| a.name}.include?(album)
    end
  end

  def self.album_score
    Album.all.each do |a|
      url = "https://pitchfork.com#{a.url}"
      a.rating = scrape_pitchfork(url).css(".score").text.to_f
    end
  end

  def self.album_description
    Album.all.each do |a|
      url = "https://pitchfork.com#{a.url}"
      a.description = scrape_pitchfork(url).css(".review-detail__abstract").text.gsub(/\u0099\u0080/, "").gsub(/â(?=\Ss)/, "'").gsub("â", "--").gsub("Ã©", "é").chomp
    end
  end
end
