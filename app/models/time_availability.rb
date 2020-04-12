class TimeAvailability < ApplicationRecord
  belongs_to :doctor

  scope :today_available_doctors, -> { where("DATE(start_time) >= ? OR DATE(end_time) <= ?", Date.today, Date.today).map(&:doctor).pluck(:email, :id)}
end
