class SearchesController < ApplicationController

  def index
    @search = Search.create!(name: params[:city])
    @landmark_names = @search.get_landmark_names

    # @image_results = Flickr.all
  end

  def show

  end

  def new
  #   @results = @landmark_names.refine_selection
  @landmark_names = Landmark.new
  end

  def create
    selected_landmarks = params[:landmarks]
    @selected_landmarks = Photo.get_images_for_location(selected_landmarks)
  end

  def update
  end

  def destroy
  end

  def edit
  end



  private def search_params
    params.require(:search).permit(:name,
                                  landmarks_attributes: [:name, :link, :search_id,
                                                            photo_attributes: [:title, :url, :owner]]
                                    )
  end

end
