class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :member_name,       null: false
      t.string :organization,      null: false
      t.string :position
      t.text :work_info,           null: false
      t.integer :valuation_id,     null: false
      t.integer :communication,    null: false
      t.integer :leadership,       null: false
      t.integer :skill,            null: false
      t.integer :motivation,       null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
