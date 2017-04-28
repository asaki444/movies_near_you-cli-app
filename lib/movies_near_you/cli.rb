#our CLI Controller
require_relative 'Scraper.rb'
class MoviesNearYou::CLI
  attr_accessor :theater, :showtimes
  def call
  puts "What is your area code?"
  zip = gets.chomp
  movie = MoviesNearYou::Scraper.new(zip)
  movie.get_page_info
  movie.print_info
  puts "Any movie that interests you?"
  time = gets.chomp
  puts "Here are the showtimes: #{movie.get_showtimes(time)}"

end
end
