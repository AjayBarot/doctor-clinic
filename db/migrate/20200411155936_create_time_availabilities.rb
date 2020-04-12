class CreateTimeAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :time_availabilities do |t|
      t.references :doctor, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
