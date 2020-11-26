module Requester
  def select_main_menu_action
    prompt = "random | scores | exit"
    options = %w[random scores exit]
    gets_option(prompt, options)
  end

  def ask_name_to_assign_score
    puts "Type the name to assign to the score"
    gets.chomp.strip
  end

  def ask_save_score
    show_score
    puts "--------------------------------------------------"
    print "Do you want to save your score? y/n "
    gets.chomp.strip.downcase
  end

  def get_number(max: 100_000)
    # prompt the user for a number between 1 and the maximum number of options
  end

  def gets_option(prompt, options)
    puts prompt
    print "> "
    input = gets.chomp.split.map(&:strip)

    until options.include?(input[0])
      puts "Invalid option"
      print "> "
      input = gets.chomp.split.map(&:strip)
    end
    input
  end
end
