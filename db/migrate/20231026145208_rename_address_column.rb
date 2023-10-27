class RenameAddressColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :adress_id, :address_id
  end
end
