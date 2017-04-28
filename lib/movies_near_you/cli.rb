#our CLI Controller
require_relative 'Scraper.rb'
class MoviesNearYou::CLI
  attr_accessor :theater, :showtimes
  def call
  puts "What is your area code?"
  zip = gets.chomp
  MoviesNearYou::Scraper.new(zip)
   if theaters == nil && the_showtimes == nil && movies == nil
     movies
   end
   summary
  end
  def movies
    # movies.all.each.with_index do |x, i|
    #   puts "#{i+1}. x"
    #end
    def list
      puts "1. Guardians of the Galaxy"
      puts "2. Toy Story 2"
      puts "3. Yo yo Ma"
    end
    def choose
       puts "Any one interest you? Please type in respective number or type exit to closee"
       num = gets.chomp
       case num
       when  "1"
         puts "movies info 1"
       when "2"
         puts "movies info 2"
       when "3"
         puts "movies info 3"
       when "list"
         list_movies
       else
         puts "list to print out movies or exit "
     end
   end
    #  movie = movies.all[num-1]
    #  movie.name
    list
    choose
   end
   def theaters
     def list
     puts "Here is a theaters to choose from"
     # movies.theater.each.with_index do |x, i|
     #   puts "#{i+1}. x"
     #end
     puts "1. 34th street"
     puts "2. 28th street"
     puts "3. 23rd street"
   end
   def choose
     puts "You have a favorite theater? Please type in respective number"
      @theater = gets.chomp
        #theater = theater.all[num-1]
    # theater.name
     end
     list
     choose
   end
   def the_showtimes
    #  movie.theater.showtimes.each.with_index do |x, i|
    #    puts "#{i+1}. x"
    #   end
    #  end
    def list
      if theater == @theater
          puts "#{@theater} has these showtimes"
           @showtimes = ["11:00 am", "12:00 pm", "1:00 pm", "2:00 pm"]
           @showtimes.each.with_index do |x,i|
             puts "#{i+1}. #{x}"
           end
       end
   end
   def choose
      puts "What is a good time for you? Please type in respective number"
      num = gets.chomp
      @showtimes[num.to_i-1]
    # movie.theater.showtimes[num-1]
     end
     list
     choose
  end

  def summary
     puts "You want to see #{movies} at #{theaters} at #{the_showtimes}!"
  end
end
