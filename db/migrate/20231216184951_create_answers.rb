class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :field_id
      t.string :field_type
      t.string :value_text
      t.integer :value_int
      t.integer :question_id
      t.integer :player_id

      t.timestamps
    end
  end
end
