class AddPartnerIdToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :partner_id, :integer
  end
end
