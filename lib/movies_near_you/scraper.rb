class MoviesNearYou::Scraper
  attr_accessor :url, :arr
  attr_reader :zip
  @@all = []
  @arr = []
  def initialize(zip = "10001")
    @zip = zip
    @@all << self
  end
  def get_page_info
   @url = "https://www.fandango.com/#{self.zip}_movietimes" if self.zip.length == 5
   @html = Nokogiri::HTML(open(@url))
   @main = @html.search("div.showtimes-movie-container")
   @main.css("a.showtimes-movie-title").each{ |x| @arr << x.text}
  end
  def print_info
    @arr.uniq.each.with_index{|x,i| puts "#{i+1}. #{x.text}" }
  end
  def get_showtimes(num)
   @main[num-1].css("time").each.with_index{|x,i| puts "#{i+1}. #{x.text}"}
  end
end
