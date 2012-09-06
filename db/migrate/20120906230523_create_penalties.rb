class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.string :name
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
