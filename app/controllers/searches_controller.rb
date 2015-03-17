class SearchesController < ApplicationController
  def index
    @searches = Search.all
    # do database stuff if params[:city]
  end

  def show
    @search = Search.new
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
