require_relative '../environment.rb'

module BestMusic
  class CLI
    @@path = 'https://pitchfork.com/reviews/best/albums/'

    def call
      puts "Welcome to Best Music!".colorize( :background => :green)
      puts "Please wait while we bring you the best new albums according to Pitchfork.com...".red

      Scraper.album_list(@@path)
      Scraper.album_score
      Scraper.album_description

      puts "The 'Best New Album' is:"
      puts "*#{Album.all[0].name}* by #{Album.all[0].artist}".colorize(:background => :red)
      puts "It has a score of #{Album.all[0].rating}".yellow
      puts "Pitchfork says: \"#{Album.all[0].description}\""
      puts "To read the full review and/or to learn more visit:"
      puts "https://pitchfork.com#{Album.all[0].url}".green
      puts "______________________".red
      puts "Check out more great music!".yellow
      instructions

      input = ""
      while input != "exit"

        puts "What would you like to do?".green

        input = gets.downcase.chomp

        case input
        when "list"
          album_list
        when "genre"
          albums_by_genre
        when "score"
          albums_by_rating
        when "help"
          instructions
        end
      end
    end

    def album_list
      puts "Below are the 12 most recent 'Best New Albums.'"
      Album.all.each do |a|
        puts "*#{a.name}* by #{a.artist}".colorize(:background => :red)
        puts "It has a score of #{a.rating}".yellow
        puts "Pitchfork says: \"#{a.description}\""
        puts "To read the full review and/or to learn more visit:"
        puts "https://pitchfork.com#{a.url}".green
        puts "______________________".yellow
      end
    end

    def albums_by_genre
      Genre.all.each do |g|
        puts "// #{g.name} //".upcase.yellow
        g.albums.each do |a|
          puts "*#{a.name}* by #{a.artist}".colorize(:background => :red)
          puts "It has a score of #{a.rating}".yellow
          puts "Pitchfork says: \"#{a.description}\""
          puts "To read the full review and/or to learn more visit:"
          puts "https://pitchfork.com#{a.url}".green
          puts "----".red
        end
      end
    end

    def albums_by_rating
      Album.albums_by_rating.each do |a|
        puts "*#{a.name}* by #{a.artist}".colorize(:background => :red)
        puts "It has a score of #{a.rating}".yellow
        puts "Pitchfork says: \"#{a.description}\""
        puts "To read the full review and/or to learn more visit:"
        puts "https://pitchfork.com#{a.url}".green
        puts "______________________".yellow
      end
    end

    def instructions
      puts "To list all recent 'Best New Albums,' type 'list'."
      puts "To browse by genre, type 'genre'."
      puts "To browse by album score, type 'score'."
      puts "To quit, type 'exit'."
    end
  end
end
