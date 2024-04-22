class AddDailyInterviewCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :daily_interview_count, :integer
    add_column :users, :last_interview_date, :date
  end
end
