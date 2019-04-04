class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @albums = []
  end

  def self.all
    @@all
  end

  def albums
    @albums
  end

  def artists
    albums.collect {|a| a.artist}.uniq
  end
end
