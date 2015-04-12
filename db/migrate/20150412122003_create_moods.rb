class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.references :user
      t.date :date
      t.integer :assignments
      t.integer :atmosphere
      t.boolean :unknown, default: false

      t.timestamps null: false
    end
  end
end
