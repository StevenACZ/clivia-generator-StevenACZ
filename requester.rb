module Requester
  def select_main_menu_action
    prompt = "random | custom | scores | exit"
    options = %w[random custom scores exit]
    gets_option(prompt: prompt, options: options)
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
    gets_option(prompt: prompt, options: options)
  end

  def select_category
    prompt = "select a category id (between 9 and 32)"
    options = (1..32).to_a.map(&:to_s)
    gets_option(prompt: prompt, options: options)
  end

  def select_difficulty
    prompt = "select a difficulty (easy, medium or hard)"
    options = %w[easy medium hard]
    gets_option(prompt: prompt, options: options)
  end

  def get_number(max: 100_000)
    options = (1..max).to_a.map(&:to_s)
    gets_option(options: options)
  end

  def gets_option(prompt: nil, options: nil)
    puts prompt unless prompt.nil?
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
