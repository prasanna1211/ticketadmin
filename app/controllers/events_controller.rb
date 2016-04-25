class EventsController < ApplicationController

  def index
    if user_signed_in?
      @events = Event.all
      
    else 
      flash[:notice] = "Please login first"
      redirect_to new_user_session_path
    end  
  end
  def create
    @event = Event.create(event_params)
    flash[:notice] = "Event created."
    redirect_to root_path
  end
  def new
    if current_user.email == "admin@admin.com"
      @event = Event.new
    else
      flash[:notice] = "Not authorized to access."
      redirect_to root_path
    end  
  end
  def edit
  end
  def show
    @event = Event.find(params[:id])
    @user = @event.users.find_by(email: current_user.email)

  end
  def update
  end
  def destroy
  end
  def attend
   @event = Event.find_by(id: params[:id]) 
   @user = User.find_by(email: current_user.email)
   @event.users << @user
   redirect_to event_path(@event)
  end
  def unattend
   @event = Event.find_by(id: params[:id]) 
   @user = User.find_by(email: current_user.email)
   @event.users.delete(@user)
   redirect_to event_path 
  end
  
  private
  def event_params
    params.require(:event).permit(:event_name, :event_type, :event_date, :event_location, :event_description)
  end
  
end
