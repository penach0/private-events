class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_ownership, only: [:edit, :update, :destroy]

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
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
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
      redirect_to @event
      flash[:success] = "Your Event was edited successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to user_path(current_user.id)
    flash[:success] = "Your Event was deleted successfully"
  end

  private
    def event_params
      params.require(:event).permit(:creator_id, :name, :date, :location, :description)
    end

    def check_ownership
      @event = Event.find(params[:id])

      unless @event.creator_logged_in?
        redirect_back(fallback_location: root_path)
        flash[:error] = "You are not allowed to do that"
      end
    end
end
