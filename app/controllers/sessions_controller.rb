class SessionsController < ApplicationController
  def new
  end

  def create
   @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        # flash["notice"] = "Hello."
        redirect_to "/places"  
      else
        flash["notice"] = "Invalid"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invalid"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to login_path
  end
end
  