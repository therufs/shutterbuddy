class Photo < ActiveRecord::Base

  def self.get_random_image

    FlickRaw.api_key=ENV['FLICKR_KEY']
    FlickRaw.shared_secret=ENV['FLICKR_SECRET']

    # list   = flickr.photos.getRecent
    list = flickr.photos.search(tags:'Eiffel Tower', license: 4, privacy_filter: 1, safe_search: 1, content_type: 1, per_page: 5 )

    id     = list[0].id
    secret = list[0].secret

    info = flickr.photos.getInfo :photo_id => id, :secret => secret

    Photo.create(url: info.urls[0])
  end

end
















end
