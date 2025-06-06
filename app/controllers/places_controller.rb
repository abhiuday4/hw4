class PlacesController < ApplicationController

  def index
    if session["user_id"]
    @places = Place.all
    else
    redirect_to "/login"
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    # @place["user_id"] = session["user_id"]
    @place.save
    redirect_to "/places"
  end

end
