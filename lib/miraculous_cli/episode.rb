class MiraculousCli::Episode
  attr_accessor :title, :code, :release_date
  
  def self.date_sort(season)
    #should return instances sorted by date maybe
    
  end
 
  def self.code_sort(season)
    #should return instances sorted by code maybe
  end 
  
  def self.find_by_code(code)
    #should return the instance with that production code.
  end
  
  def self.all 
    ep_1 = self.new 
    ep_1.title = "The Bubbler"
    ep_1.code = 109
    ep_1.release_date = "December 6, 2015"
    
    ep_2 = self.new 
    ep_2.title = "Mr. Pigeon"
    ep_2.code = 106
    ep_2.release_date = "December 13, 2015"
    
    [ep_1.title, ep_2.title]
  end
  
  
end