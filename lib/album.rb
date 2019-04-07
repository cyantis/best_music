require_relative './genre.rb'

class Album
  attr_accessor :name, :artist, :genre, :url, :rating, :description

  @@all = []

  def initialize(name, artist, genre, url)
    @name = name
    @artist = artist
    @genre = genre
    @url = url
    Genre.all.each {|g| g.albums << self if g.name == genre}
    self.class.all << self
  end

  def self.all
    @@all
  end

 def self.albums_by_rating
   all.sort_by {|a| a.rating}.reverse
 end
end
