class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @albums = []
    self.class.all << self
  end

  def self.all
    @@all
  end

  def albums
    @albums
  end

end
