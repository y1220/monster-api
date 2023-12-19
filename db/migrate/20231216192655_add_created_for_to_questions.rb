class AddCreatedForToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :created_for, :integer
  end
end
