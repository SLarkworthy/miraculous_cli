class MiraculousCli::Scraper
  
  def self.scrape_episodes
    episode_array = [] #array of episode hashes in proper format to be instantiated into episodes
    site = "https://miraculousladybug.fandom.com/wiki/Episode_guide"
    page = Nokogiri::HTML(open(site))
    #title = page.css("tr")[index].text.strip.to_s.split("\"")[1]
    #release_date = page.css("tr")[index].text.split(/\n/)[4]
    #code = page.css("tr")[index].text.split(/\n/)[6]
    #index 10-35, 91-116, 172-197
    page.css("div.tabbertab tr").each_with_index do |episode, index|
      if (index > 0 && index < 27) || (index > 81 && index < 108) || (index > 162 && index < 189)
        episode_attributes = {}
        episode_attributes[:title] = episode.text.strip.to_s.split("\"")[1]
        episode_attributes[:code] = episode.text.split(/\n/)[6]
        episode_attributes[:release_date] = episode.text.split(/\n/)[4]
        episode_array << episode_attributes
      end
    end
    episode_array
  end
  
end