class Artist
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

  def add_album(album)
    album.artist = self if !album.artist
    albums << album if !albums.include?(album)
  end

  def genres
    songs.collect {|s| s.genre}.uniq
  end
end
