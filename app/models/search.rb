class Search < ActiveRecord::Base
  has_many :landmarks

  # def initialize
  #   @client = GoogleEmbedded::REST::Client.new do |config|
  #     config.google_key = ENV['GOOGLE_KEY']
  #   end
  # end

  # def show_map
  #   puts HTTParty.get("https://www.google.com/maps/embed/v1/search?key=#{ENV['GOOGLE_KEY']}&q=record+stores+in+Seattle")
  # end


  def map_query
    #  tourism = ["amusement_park", aquarium,casino, church, mosque,library,hindu_temple, embassy, muesum, night_club, park, place_of_worship, stadium, synagogue,]

    "#{name.split.join('+')}"
    #tourism+in+
  end

  def get_landmarks
    landmarks = []

    @get_landmarks = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=point_of_interest+in+#{name.split.join('+')}&key=#{ENV['GOOGLE_KEY']}")

    # get_landmarks.each do |l|
    #   if
    #
    # landmarks << get_landmarks.type2
    # # do database stuff USING Google Places API and HTTParty
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
