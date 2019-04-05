require_relative './genre.rb'

class Album
  attr_accessor :name, :artist, :genre, :url, :rating, :description

  @@all = []

  def initialize(name, artist, genre, url)
    @name = name
    @artist = artist
    @genre = genre
    @url = url
    #genre.albums << self if !genre.albums.include?(self)
    self.class.all << self
  end

  def self.all
    @@all
  end

 def self.albums_by_rating
   all.collect {|a| a.rating}.sort
 end
end
