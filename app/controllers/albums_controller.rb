class AlbumsController < ApplicationController
  def index
    @photos = params[:photos]
  end
end
