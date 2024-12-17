class CreateActiveAdminComments < ActiveRecord::Migration[8.0]
  

  def self.down
    drop_table :active_admin_comments
  end
end
