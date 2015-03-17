class SearchesController < ApplicationController
  def index
    @search = Search.new
    @search.name = params[:city] 
    # do database stuff if params[:city] USING Google Places API
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
