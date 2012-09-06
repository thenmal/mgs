class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|
      t.string :title
      t.integer :rating
      t.text :text
      t.string :imageurl

      t.timestamps
    end
  end
end
