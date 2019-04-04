class Album
  attr_accessor :artist
  attr_reader :name, :genre, :rating

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

 def genre=(genre)
   @genre = genre
   genre.albums << self if !genre.albums.include?(self)
 end

 def rating=(rating)
   @rating = rating.to_i
 end

 def self.albums_by_rating
   all.collect {|a| a.rating}.sort
 end
end
