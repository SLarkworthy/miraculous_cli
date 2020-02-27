class MiraculousCli::Episode
  attr_accessor :title, :code, :release_date
  
  @@all = []
  
  def initialize(episode_hash)
    episode_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_scraper(episodes)
    episodes.each do |episode_hash|
      self.new(episode_hash)
    end
  end
  
  def self.find_by_code(code)
    puts "You made it to the fbc method for code #{code}"
  end
  
  def self.all 
    @@all
  end
  
  
end