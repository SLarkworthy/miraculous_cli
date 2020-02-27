class MiraculousCli::Scraper
  
  def self.scrape_episodes(url = nil)
    episodes = [] #array of episode hashes in proper format to be instantiated into episodes
    site = "https://miraculousladybug.fandom.com/wiki/Episode_guide"
    page = Nokogiri::HTML(open(site))
    #title = page.css("tr")[index].text.strip.to_s.split("\"")[1]
    #release_date = page.css("tr")[index].text.split(/\n/)[4]
    #code = page.css("tr")[index].text.split(/\n/)[6]
    #index 10-35, 91-116, 172-197
    page.css("tr").each_with_index do |episode, index|
      if (index > 9 && index < 36) || (index > 90 && index < 117) || (index > 171 && index < 198)
        episode_attributes = {}
        episode_attributes[:title] = episode.text.strip.to_s.split("\"")[1]
        episode_attributes[:code] = episode.text.split(/\n/)[6]
        episode_attributes[:release_date] = episode.text.split(/\n/)[4]
        episodes << episode_attributes
      end
    end
    episodes
  end
  
end