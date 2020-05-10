class CitiesController < ApplicationController
  def new
    @city = City.new

  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
      @cities = City.all
  end

  def show

  end
end
