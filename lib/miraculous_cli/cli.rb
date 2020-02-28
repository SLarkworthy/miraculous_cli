#CLI controller
class MiraculousCli::CLI
  
  def call
    make_episodes
    puts "Welcome to your Miraculous Ladybug Episode Sorter!"
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
      puts "Press 1, 2, or 3 to get the episode list of that season."
      puts "Press 4 to find an episode by production code."
      input = gets.strip
      case input #refactor this later!!!
      when "1"
        sorter("1")
      when "2"
        sorter("2")
      when "3"
        sorter("3")
      when "4"
        episode_finder
      when "exit"
        puts "Exiting already? Type 'exit' again to confirm."
      else 
        puts "invalid input"
      end
      puts "Would you like more information? (y/n)" unless input == "exit"
      input = gets.strip
      if input == "y" || input == "yes"
        puts "Here are your options!"
      elsif input == "n" || input == "no"
        input = "exit"
      end
    end
  end
  
  def sorter(season)
    puts "Press 1 to list by air date. Press 2 to sort by production code."
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
  
  def episode_finder
    puts "Please enter a production code."
    code = gets.strip
    instance = MiraculousCli::Episode.find_by_code(code)
    if instance == nil
      puts "Invalid code. Please see episode lists for valid codes."
    else
      puts instance.title
    end
  end
  
  def goodbye
    puts "Au revoir! Thank you for using this miraculous CLI!"
  end
  
  def date_sort(season)
    MiraculousCli::Episode.all.each do |episode|
      puts episode.title if episode.code.start_with?(season)
    end
    #it currently just prints titles but I will make it print a pretty format eventually.
    #goal format: 1. The Bubbler - 101
  end
  
  def code_sort(season)
    sorted_episode_instances = MiraculousCli::Episode.all.sort {|a, b| a.code <=> b.code}
    sorted_episode_instances.each do |episode|
      puts episode.title if episode.code.start_with?(season)
    end
  end
  
end