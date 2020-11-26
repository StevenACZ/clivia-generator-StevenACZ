require "httparty"
require "json"

class TriviaController
  include HTTParty
  base_uri "https://opentdb.com/api.php"

  def self.index
    options = {
      headers: { "Content-Type" => "application/json" },
    }

    response = get("?amount=10", options)
    raise Net::HTTPError.new(response.message, response) unless response.success?
    trivias = JSON.parse(response.body, symbolize_names: true)
    trivias[:results]
  end
end