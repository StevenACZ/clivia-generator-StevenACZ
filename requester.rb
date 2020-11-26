module Requester
  def select_main_menu_action
    prompt = "random | custom | scores | exit"
    options = %w[random custom scores exit]
    gets_option(prompt, options)
  end

  def ask_name_to_assign_score
    puts "Type the name to assign to the score"
    gets.chomp.strip
  end

  def ask_save_score
    show_score
    puts "--------------------------------------------------"
    prompt = "Do you want to save your score? y/n "
    options = %w[y n]
    gets_option(prompt, options)
  end

  def select_category
    puts "select a category id (between 9 and 32)"
    gets.chomp.strip
  end

  def select_difficulty
    puts "select a difficulty (easy, medium or hard)"
    gets.chomp.strip
  end

  def get_number(max: 100_000)
    # prompt the user for a number between 1 and the maximum number of options
  end

  def gets_option(prompt, options)
    puts prompt
    print "> "
    input = gets.chomp.strip

    until options.include?(input)
      puts "Invalid option"
      print "> "
      input = gets.chomp.strip
    end
    input
  end
end
