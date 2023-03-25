class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendance = Attendance.create(attendance_params)
    flash[:sucess] = "You are going to this event!"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @attendance = Attendance.find_by(attendance_params)

    if @attendance
      @attendance.destroy
      flash[:sucess] = "You are no longer going to this event"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "You are not set to attend this event"
    end
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end
end
