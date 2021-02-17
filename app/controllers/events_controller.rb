class EventsController < ApplicationController
  def index; end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'Event created successfully'
      redirect_to events_path
    else
      flash[:alert] = 'Event is not created, try again'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
