class Search < ActiveRecord::Base
  has_many :landmarks


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
      url ="https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourism+in+#{name.split.join('+')}&key=#{ENV['GOOGLE_KEY']}"

      response = HTTParty.get(url, headers: {"Referer" => "http://localhost:3000/"})

      results = response["results"]

      results.reverse.sort_by! {|a| a["rating"].to_f}

      results.each do |r|
        landmark_names << r["name"]
      end
    end
  
    landmark_names
  end

end
