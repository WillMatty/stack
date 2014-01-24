# To run this, do `rake scrape_reddit` in the command line

task scrape_reddit: :environment do

  # Grab the raw html from reddit
  # I want to turn it back into usable HTML
  # I want to find certain parts of the HTML to make as a new story
  # Then I want to save each story

  @raw_html = HTTParty.get('http://www.reddit.com')

  @html = Nokogiri::HTML(@raw_html.body)

  # Story.delete_all

  # .css works like a CSS selector
  @html.css("#siteTable .entry .title").each do |link|

    @story = Story.new
    @story.title = link.text
    @story.description = "From Reddit"
    @story.url = link[:href]
    @story.save

  end

end
