class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.create(attendance_params)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @attendance = Attendance.find_by(attendance_params)
    @attendance.destroy

    redirect_back(fallback_location: root_path)
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end
end
