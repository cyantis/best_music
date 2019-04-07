require_relative './scraper.rb'

module BestMusic
  class CLI
    @@path = 'https://pitchfork.com/reviews/best/albums/'

    def call
      puts "Welcome to Best Music!"
      puts "Please wait while we bring you the best new albums according to Pitchfork.com..."
      Scraper.album_list(@@path)
      Scraper.album_score
      Scraper.album_description
      puts "The 'Album of the Week' is:"
      puts "*#{Album.all[0].name}* by #{Album.all[0].artist}"
      puts "It has a score of #{Album.all[0].rating}"
      puts "Pitchfork says: '#{Album.all[0].description}'"
      puts "To read the full review and/or to learn more visit:"
      puts "https://pitchfork.com#{Album.all[0].url}"
      puts "______________________"
      puts "Check out more great music!"
      puts "To list all recent 'Albums of the Week,' type 'list'."
      puts "To browse by genre, type 'genre'."
      puts "To browse by album score, type 'score'."
      puts "To quit, type 'exit'."

      input = ""
      while input != "exit"

        puts "What would you like to do?"

        input = gets.downcase.chomp

        case input
        when "list"
          album_list
        when "genre"
          albums_by_genre
        when "score"
          albums_by_rating
        when "help"
          help
        end
      end
    end

    def album_list
      puts "Below are the 'Albums of the Week' for the past 12 weeks."
      Album.all.each do |a|
        puts "*#{a.name}* by #{a.artist}"
        puts "It has a score of #{a.rating}"
        puts "Pitchfork says: '#{a.description}'"
        puts "To read the full review and/or to learn more visit:"
        puts "https://pitchfork.com#{a.url}"
        puts "______________________"
      end
    end

    def albums_by_genre
      Genre.all.each do |g|
        puts "______________________"
        puts "// #{g.name} //".upcase
        g.albums.each do |a|
          puts "*#{a.name}* by #{a.artist}"
          puts "It has a score of #{a.rating}"
          puts "Pitchfork says: '#{a.description}'"
          puts "To read the full review and/or to learn more visit:"
          puts "https://pitchfork.com#{a.url}"
          puts "----"
        end
      end
    end

    def albums_by_rating
      Album.albums_by_rating.each do |a|
        puts "*#{a.name}* by #{a.artist}"
        puts "It has a score of #{a.rating}"
        puts "Pitchfork says: '#{a.description}'"
        puts "To read the full review and/or to learn more visit:"
        puts "https://pitchfork.com#{a.url}"
        puts "______________________"
      end
    end

    def help
      puts "To list all recent 'Albums of the Week,' type 'list'."
      puts "To browse by genre, type 'genre'."
      puts "To browse by album score, type 'score'."
      puts "To quit, type 'exit'."
    end
  end
end
