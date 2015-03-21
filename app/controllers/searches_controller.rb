class SearchesController < ApplicationController
  def index
    @search = Search.create!(name: params[:city])
    @landmark_names = @search.get_landmark_names
    # @image_results = Flickr.all
  end

  def show

  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
