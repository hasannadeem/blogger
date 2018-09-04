class AddSerialToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :serial, :string
  end
end
