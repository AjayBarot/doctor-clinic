class AppointmentsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  before_action :doctor_data, only: [:new, :edit]

  def index
    condition = if current_patient.present?
                  {patient_id: current_patient}
                elsif current_doctor.present?
                  {doctor_id: current_doctor}
                else
                  {}
                end
    @appointments = Appointment.where(condition)
  end

  def new
    @appointment  = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(app_params)
    respond_to do |format|
      if @appointment.save
        <%=
        format.html { redirect_to appointments_path, notice: I18n.t('appointment.flash.create') }
      else
        format.html { redirect_to new_appointment_path }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @appointment.update(app_params)
        format.html { redirect_to appointments_path, notice: I18n.t('appointment.flash.update')  }
      else
        format.html { redirect_to edit_appointment_path }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_path, notice: I18n.t('appointment.flash.delete') }
    end
  end

  private

  def set_app
    @appointment = Appointment.find(params[:id])
  end

  def doctor_data
    @doctor_data  = TimeAvailability.today_available_doctors
  end

  def app_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :status)
  end
end
