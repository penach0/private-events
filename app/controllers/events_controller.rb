class EventsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.build_event

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
