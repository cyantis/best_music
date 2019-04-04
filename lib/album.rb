class Album
  attr_accessor :name, :rating, :description
  attr_reader :artist, :genre

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
   @artist = artist
   artist.add_album(self)
 end

 def genre=(genre)
   @genre = genre
   genre.albums << self if !genre.albums.include?(self)
 end

end
