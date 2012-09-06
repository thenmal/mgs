class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :dare
      t.references :game

      t.timestamps
    end
    add_index :questions, :dare_id
    add_index :questions, :game_id
  end
end
