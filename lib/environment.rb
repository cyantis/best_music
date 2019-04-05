#require_relative "./best_music/version"
require_relative './scraper.rb'

class CLI
  def run
    puts "TEST."
    Scraper.album_list(https://pitchfork.com/reviews/best/albums/)
    Scraper.album_score
  end
end


module BestMusic
  class Error < StandardError; end
  # Your code goes here...
end
