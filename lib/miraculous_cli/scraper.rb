class MiraculousCli::Scraper
  
  def self.scrape_episodes
    site = "https://miraculousladybug.fandom.com/wiki/Episode_guide"
    page = Nokogiri::HTML(open(site))
    #title = page.css("tr")[index].text.split("\"")[1]
    #release_date = page.css("tr")[index].text.split(/\n/)[4]
    #code = page.css("tr")[index].text.split(/\n/)[6]
    #index 1-26, 82-107, 163-188
    page.css("div.tabbertab tr").map.with_index do |episode, index|
      if (index > 0 && index < 27) || (index > 81 && index < 108) || (index > 162 && index < 189)
        episode_attributes = {}
        episode_attributes[:title] = episode.text.split("\"")[1]
        episode_attributes[:code] = episode.text.split(/\n/)[6]
        episode_attributes[:release_date] = episode.text.split(/\n/)[4]
        episode_attributes
      end
    end.compact
  end
  
end