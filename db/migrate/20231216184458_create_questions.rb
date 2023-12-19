class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :created_by
      t.integer :created_for
      t.boolean :hide

      t.timestamps
    end
  end
end
