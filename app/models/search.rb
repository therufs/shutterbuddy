class Search < ActiveRecord::Base
  has_many :landmarks

  # def show_map
  #   puts HTTParty.get("https://www.google.com/maps/embed/v1/search?key=#{ENV['GOOGLE_KEY']}&q=record+stores+in+Seattle")
  # end


  def map_query
    if name.present?
      "tourism+in+#{name.split.join('+')}"
    else
      "Rome+Italy"
    end
  end

  def get_landmark_names
    landmark_names = []
    if name.present?
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=landmarks+in+#{name.split.join('+')}&key=#{ENV['GOOGLE_KEY']}"

    response = HTTParty.get(url, headers: {"Referer" => "http://localhost:3000/"})

    results = response["results"]

    results.each do |r|
      landmark_names << r["name"]

    end
  end

    landmark_names
  end
end
