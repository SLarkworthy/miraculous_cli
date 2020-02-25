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
      when "2"
        puts "Here is a list of season #{season} by production code"
      end
  end
  
  def episode_finder
    puts "Please enter a production code."
    input = gets.strip
    puts input.to_i 
    #this gets the production code to hopefully make a finder method out of.
  end
  
  def goodbye
    puts "Au revoir! Thank you for using this miraculous CLI!"
  end
  
  
end