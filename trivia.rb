require_relative "trivia_controller"
require "htmlentities"

module Trivia
  def random_trivia
    parse_questions
    @score = 0

    load_questions

    will_save?
  end

  def custom_trivia
    category = select_category
    difficulty = select_difficulty

    parse_questions(category: category, difficulty: difficulty)
    @score = 0

    load_questions

    will_save?
  end

  private

  def will_save?
    answer = ask_save_score
    save_player if answer == "y"
  end

  def save_player
    name = ask_name_to_assign_score
    name = name.empty? ? "Anonymous" : name
    data = { name: name, score: @score }
    save(data)
  end

  def save(data)
    parse_scores
    export_scores(data)
  end

  def parse_questions(category: nil, difficulty: nil)
    coder = HTMLEntities.new
    @trivias = TriviaController.index(category: category, difficulty: difficulty)
    @trivias.map! do |trivia|
      {
        category: coder.decode(trivia[:category]),
        type: coder.decode(trivia[:type]),
        difficulty: coder.decode(trivia[:difficulty]),
        question: coder.decode(trivia[:question]),
        correct_answer: coder.decode(trivia[:correct_answer]),
        incorrect_answers: trivia[:incorrect_answers].map { |incorrect_answer| coder.decode(incorrect_answer) }
      }
    end
  end

  def load_questions
    @trivias.each do |trivia|
      print_question(trivia)
      answer = gets.chomp.strip
      ask_question(trivia[:incorrect_answers][answer.to_i - 1], trivia[:correct_answer])
    end
  end

  def ask_question(answer, correct_answer)
    if answer == correct_answer
      @score += 10
      puts "#{answer}... Correct!"
      show_score
    else
      puts "#{answer}... Incorrect!"
      puts "The correct answer was: #{correct_answer}"
    end
  end
end
