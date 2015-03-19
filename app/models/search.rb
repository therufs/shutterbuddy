class Search < ActiveRecord::Base
  has_many :landmarks

  # def show_map
  #   puts HTTParty.get("https://www.google.com/maps/embed/v1/search?key=#{ENV['GOOGLE_KEY']}&q=record+stores+in+Seattle")
  # end


  def map_query
    #  tourism = ["amusement_park", aquarium,casino, church, mosque,library,hindu_temple, embassy, muesum, night_club, park, place_of_worship, stadium, synagogue,]

    "tourism+in+#{name.split.join('+')}"
    #tourism+in+
  end

  def get_landmark_names
    landmark_names = []
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=landmarks+in+#{name.split.join('+')}&key=#{ENV['GOOGLE_KEY']}"

    response = HTTParty.get(url, headers: {"Referer" => "http://localhost:3000/"})

    results = response["results"]

    results.each do |r|
      landmark_names << r["name"]

    end

    landmark_names
  end

  # def save_landmarks
#   HTTParty.post("http://sentiment.vivekn.com/api/text/", body: { txt: text } )
# end
  #
  # def save_landmarks
  #   # do database stuff USING Google Places API and HTTParty
  #   # Make landmarks like landmarks << Landmark.new(..........)
  # end



end
