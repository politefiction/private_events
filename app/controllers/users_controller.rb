class UsersController < ApplicationController
  helper_method :upcoming_events, :previous_events

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      render 'show'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def upcoming_events
    @user.attended_events.where("event_date > ?", Time.now)
  end

  def previous_events
    @user.attended_events.where("event_date < ?", Time.now)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
