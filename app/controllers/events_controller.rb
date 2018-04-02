class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    if logged_in?
      params[:event][:creator_id] = current_user.id
      @event = Event.new(event_params)
      if @event.save
        render 'show'
      end
    else
      flash[:danger] = "You must be logged in for this action."
      redirect_to login_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if logged_in?
      flash[:success] = "You've been added to the guest list."
      save_rsvp
      render 'show'
    else
      flash[:danger] = "You must be logged in for this action."
      redirect_to login_path
    end
  end


  private

    def event_params
      params.require(:event).permit(:name, :description, :event_date, :creator_id)
      # figure out how to record creator_id
    end

    def save_rsvp
      @event.attendees << current_user
      @event.save
    end
end
