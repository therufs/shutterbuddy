class SearchesController < ApplicationController
  before_action :set_search, only:[:show, :destroy, :update]

  def index
    @search = Search.new
    # Often contains default values for instance variables.
    # Doesn't usually create anything.
    # Should definitely populate whatever you need in /index.html.

    # You could: use an image placeholder
    # OR: you could create an instance variable that is *just* a city name
    #     and not a Search object.
    unless @city_name
        @city_name = "Rome"
    end

    @photos = params[:photos]

    # @image_results = Flickr.all
  end

  def show
    @selected_landmarks = Photo.get_images_for_location(@selected_landmarks)
  end

  def new
    @search = Search.new
    #   @results = @landmark_names.refine_selection
    @landmark_names = Landmark.new
  end

  def create
    @search = Search.new(name: params[:city])
    if @search.save
      redirect_to @search
    else
      "invalid search terms, please enter a city name"
    end
    selected_landmarks = params[:landmarks]
    @selected_landmarks = selected_landmarks
  end

  def create_album
    @album = Album.create(params[:selected_landmarks])
    # @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end




  def update
  end

  def destroy
  end

  def edit
  end

  private
  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name,
                                  landmarks_attributes: [:name, :link, :search_id,
                                                            photo_attributes: [:title, :url, :owner]]
                                    )
  end

end
