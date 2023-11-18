class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :role

      t.timestamps
    end
  end
end
