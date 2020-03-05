#CLI controller
class MiraculousCli::CLI
  
  def call
    make_episodes
    puts "Bonjour! Welcome to your Miraculous Ladybug Episode Sorter!"
    menu
    goodbye
  end
  
  def make_episodes
    episodes = MiraculousCli::Scraper.scrape_episodes
    MiraculousCli::Episode.create_from_scraper(episodes)
  end
  
  def menu
    input = ""
    while input != "exit"
      puts "Press 1, 2, or 3 to get a list of that season's episodes."
      puts "Press 4 to get episode information by production code."
      puts "Press 5 to get episode information by episode title."
      input = gets.strip
      case input
      when "1".."3"
        sorter(input)
      when "4"
        episode_code_finder
      when "5"
        episode_title_finder
      else 
        puts "invalid input" unless input == "exit"
      end
      
      puts "Would you like more information? (y/n)" unless input == "exit"
      input = gets.strip unless input == "exit"
      if input == "y" || input == "yes"
        puts "Here are your options!"
      elsif input == "n" || input == "no"
        input = "exit"
      end
    end
  end
  
  def sorter(season)
    puts "Press 1 for episodes in order of air date."
    puts "Press 2 for episodes in order of production code."
      input = gets.strip
      case input
      when "1"
        puts "Here is a list of season #{season} by air date"
        date_sort(season)
      when "2"
        puts "Here is a list of season #{season} by production code"
        code_sort(season)
      end
  end
  
  def episode_code_finder
    puts "Please enter a production code."
    code = gets.strip
    instance = MiraculousCli::Episode.find_by_code(code)
    if instance == nil
      puts "Invalid code. Please see episode lists for valid codes."
    else
      puts "#{instance.code} - #{instance.title} - #{instance.release_date}"
    end
  end
  
  def episode_title_finder
    puts "Please enter an episode title"
    title = gets.strip
    instance = MiraculousCli::Episode.find_by_title(title)
    if instance == nil
      puts "Invalid title. Please see episode lists for titles."
    else
      puts "#{instance.code} - #{instance.title} - #{instance.release_date}"
    end
  end
  
  def goodbye
    puts "Au revoir! Thank you for using this miraculous CLI!"
  end
  
  def date_sort(season)
    MiraculousCli::Episode.all.each_with_index do |episode, index|
      if episode.code.start_with?(season)
        puts "#{index + 1}. #{episode.title} - #{episode.code}"
      end
    end
  end
  
  def code_sort(season)
    sorted_episode_instances = MiraculousCli::Episode.all.sort {|a, b| a.code <=> b.code}
    sorted_episode_instances.each do |episode|
      if episode.code.start_with?(season)
        puts "#{episode.code} - #{episode.title}"
      end
    end
  end
  
end



