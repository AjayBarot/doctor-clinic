class TimeAvailabilitiesController < ApplicationController
  before_action :set_time, only: [:show, :edit, :update, :destroy]

  def index
    @time_availabilities = TimeAvailability.all
  end

  def show
  end

  def new
    @time_availability = TimeAvailability.new
  end

  def edit
  end

  def create
    @time_availability = TimeAvailability.new(time_params)
    respond_to do |format|
      if @time_availability.save

        format.html { redirect_to @time_availability, notice: I18n.t('time.flash.common', action: 'created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_availability.update(time_params)
        format.html { redirect_to @time_availability, notice: I18n.t('time.flash.common', action: 'updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @time_availability.destroy
    respond_to do |format|
      format.html { redirect_to time_availabilities_path, notice: I18n.t('time.flash.common', action: 'destroyed') }
    end
  end

  private
    def set_time
      @time_availability = TimeAvailability.find(params[:id])
    end

    def time_params
      params.require(:time_availability).permit(:start_time, :end_time, :doctor_id)
    end
end