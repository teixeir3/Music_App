class AddUsersActivationTokenCol < ActiveRecord::Migration
  def change
    add_column :users, :activation_token, :string, default: "INACTIVE", :null => false
  end
end
