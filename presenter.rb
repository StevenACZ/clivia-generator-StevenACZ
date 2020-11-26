require "terminal-table"

module Presenter
  def print_welcome
    puts "###################################"
    puts "#   Welcome to Trivia Generator   #"
    puts "###################################"
  end

  def print_question(trivia)
    trivia[:incorrect_answers] = trivia[:incorrect_answers].push(trivia[:correct_answer]).shuffle
    puts "Category: #{trivia[:category]} | Difficulty: #{trivia[:difficulty]}"
    puts "Question: #{trivia[:question]}"
    trivia[:incorrect_answers].each_with_index  do |incorrect_answer, index|
      puts "#{index + 1}. #{incorrect_answer}"
    end
  end

  def print_scores
    table = Terminal::Table.new
    table.title = "Top Scores"
    table.headings = %w[Name Score]
    table.rows = @scores_data.map do |score_data|
      [
        score_data[:name],
        score_data[:score]
      ]
    end
    puts table
  end

  def show_score
    puts "Well done! Your score is #{@score}"
  end
end
