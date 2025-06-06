class EntriesController < ApplicationController

  
  def index
    if session["user_id"]
      @entries = Entry.where({ "user_id" => session["user_id"] })
    else
      redirect_to "/login"
    end
  end


  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
