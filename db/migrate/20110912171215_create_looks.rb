class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.integer :id
      t.string :desc

      t.timestamps
    end
  end
end
