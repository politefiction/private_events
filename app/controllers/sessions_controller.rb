class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:session][:user_id])
    if user
      log_in(user)
      redirect_to user
    else
      flash[:danger] = "Invalid user."
      render 'new'
      # flash[:danger] = "Invalid user. Please try again."
      # redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    render 'new'
  end
end
