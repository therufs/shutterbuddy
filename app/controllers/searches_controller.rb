class SearchesController < ApplicationController
  def index
    @search = Search.create!(name: params[:city])
    @landmarks = @search.get_landmarks
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
