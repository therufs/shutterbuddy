class Photo < ActiveRecord::Base

  def self.get_random_image

    FlickRaw.api_key=ENV['FLICKR_KEY']
    FlickRaw.shared_secret=ENV['FLICKR_SECRET']

    list   = flickr.photos.getRecent

    id     = list[0].id
    secret = list[0].secret
    info = flickr.photos.getInfo :photo_id => id, :secret => secret

    Photo.create(url: info.urls[0])

  end
end
