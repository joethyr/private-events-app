class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: %i[ show edit update destroy ]
  def index
    @events = Event.all
  end

  def new
    # @event = Event.new
    @event = current_user.creator_events.build
  end

  def show
  end

  def create
    # the build method creates the event with the user's id prepopulated
    @event = current_user.creator_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: "Your event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :location, :description, :creator_id)
  end
end
