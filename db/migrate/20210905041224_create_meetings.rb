class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.date :meeting_date,  null: false
      t.text :meeting_info,  null: false 
      t.references :member,  null: false, foreign_key: true
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
