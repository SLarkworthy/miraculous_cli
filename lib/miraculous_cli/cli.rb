#CLI controller
class MiraculousCli::CLI
  
  def call
    puts "Welcome to your Miraculous Ladybug Episode Sorter!"
    menu
    goodbye
  end
  
  def menu
    input = ""
    while input != "exit"
      puts "Press 1, 2, or 3 to get the episode list of that season."
      puts "Press 4 to find an episode by production code."
      input = gets.strip
      case input
      when "1"
        sorter(1)
      when "2"
        sorter(2)
      when "3"
        sorter(3)
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
    #I want some sort of finder method
    puts "Please enter a production code."
    input = gets.strip
    code = input.to_i
    MiraculousCli::Episode.find_by_code(code)
  end
  
  def goodbye
    puts "Au revoir! Thank you for using this miraculous CLI!"
  end
  
  def date_sort(season)
    puts MiraculousCli::Episode.all 
    puts "You are in date_sort #{season}"
    #the scraper should already scrape these in date order so this should work
    #it currently just prints instances but I will make it print a pretty format eventually.
  end
  
  def code_sort(season)
    puts "You successfuly reached the code sort method for season #{season}"
  end
  
end