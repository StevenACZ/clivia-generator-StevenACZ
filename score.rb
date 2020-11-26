module Score
  def parse_scores
    @scores_data = JSON.parse(File.read("scores.json"), symbolize_names: true)
    @scores_data.sort_by! { |score_data| score_data[:score] }.reverse!
  end

  def export_scores(data)
    @scores_data.push(data)
    File.write("scores.json", @scores_data.to_json, mode: "w")
  end
end