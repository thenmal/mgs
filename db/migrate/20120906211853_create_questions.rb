class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :player
      t.references :dare

      t.timestamps
    end
    add_index :questions, :player_id
    add_index :questions, :dare_id
  end
end
