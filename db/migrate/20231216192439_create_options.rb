class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :title
      t.integer :question_id

      t.timestamps
    end
  end
end
