class CreateLooks < ActiveRecord::Migration
  def change
  drop_table :looks
    create_table :looks do |t|
      t.integer :id
      t.integer :lid
      t.string :desc

      t.timestamps
    end
  end
end
