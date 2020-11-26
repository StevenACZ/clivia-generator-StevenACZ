require "httparty"
require "json"

class TriviaController
  include HTTParty
  base_uri "https://opentdb.com/api.php"

  def self.index(category: nil, difficulty: nil)
    options = {
      headers: { "Content-Type" => "application/json" }
    }

    category_and_difficulty = "&category=#{category}&difficulty=#{difficulty}"
    custom = category.nil? && difficulty.nil? ? nil : category_and_difficulty
    response = get("?amount=10#{custom}", options)

    raise Net::HTTPError.new(response.message, response) unless response.success?

    trivias = JSON.parse(response.body, symbolize_names: true)
    trivias[:results]
  end
end
