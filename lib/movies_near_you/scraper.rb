class MoviesNearYou::Scraper
  attr_accessor :url, :arr
  attr_reader :zip
  @@all = []
  def initialize(zip = "10001")
    @zip = zip
    @@all << self
  end
  def doc
    @url = "https://www.fandango.com/#{self.zip}_movietimes" if self.zip.length == 5
    @html = Nokogiri::HTML(open(@url))
    @main = @html.search("div.showtimes-movie-container")
  end
  def get_page_info
   @arr = []
   doc.css("a.showtimes-movie-title").each{ |x| @arr << x.text}
   @arr
  end
  def print_info
   get_page_info.uniq.each.with_index{|x,i| puts "#{i+1}. #{x}" }
  end
  def get_showtimes(num)
   doc[num.to_i-1].css("time").each.with_index{|x,i| puts "#{i+1}. #{x.text}"}
  end
end
