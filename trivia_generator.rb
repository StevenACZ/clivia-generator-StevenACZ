require_relative "presenter"
require_relative "requester"
require_relative "trivia"
require_relative "score"

class TriviaGenerator
  include Presenter
  include Requester
  include Trivia
  include Score

  def initialize
    @trivias = []
    @scores_data = []
  end

  def start
    until print_welcome
      parse_scores 
      action, _id = select_main_menu_action
      case action
      when "random" then random_trivia
      when "scores" then print_scores
      when "exit" then break
      end
    end
  end
end

trivia = TriviaGenerator.new
trivia.start
