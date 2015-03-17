class Search < ActiveRecord::Base
  has_many :landmarks

  # def show_map
  #   puts HTTParty.get("https://www.google.com/maps/embed/v1/search?key=#{ENV['GOOGLE_KEY']}&q=record+stores+in+Seattle")
  # end


  def map_query
    "art_gallery+aquarium+in+#{name.split.join('+')}"
  end

end
