class EventsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'Your event was created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Your event was updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def attend
    @user = current_user
    @event = Event.find(params[:id])

    if @event.attendees.include?(@user)
      redirect_to @event, notice: "You are already attending this event"
    else
      @event.attendees << @user
      redirect_to @event
    end
  end

  def unattend
    @user = current_user
    @event = Event.find(params[:id])

    @event.attendees.delete(@user)
    redirect_to @event, notice: "You are no longer attending this event"
  end

  private

  def event_params
    params.require(:event).permit(:title, :datetime, :location)
  end
end
