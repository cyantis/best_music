#require_relative "./best_music/version"
require_relative './scraper.rb'

class CLI
  def run
    puts "Loading, please wait..."
    Scraper.album_list('https://pitchfork.com/reviews/best/albums/')
    Scraper.album_score
    Scraper.album_description
    binding.pry
  end
end


module BestMusic
  class Error < StandardError; end
  # Your code goes here...
end
