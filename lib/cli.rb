class CLI
  def run 
    greeting
    while menu != 'exit'

    end
    end_program
  end

  def greeting
    puts "Hello, make a selection"
  end 


  def end_program
    puts "exiting program"
  end

  def menu 
    scrape_options
    puts "see what scraped?"
    input = gets.chomp 
    chose_option(input)
    return input

  end

  def chose_option(input)
    case input
    when "1"
      puts "Freshwater chosen"
    when "2" 
      puts "Brackish water chosen"
    when "3" 
      puts "Saltwater chosen"
    end
  end

  def scrape_options
    puts "1. Freshwater"
    puts "2. Brackish water"
    puts "3. Saltwater"
    puts "exit"
  
  end
end
