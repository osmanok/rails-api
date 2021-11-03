class AddDefaultValueToVisible < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :visible, :boolean, default: true
  end

  def down
    change_column :posts, :visible, :boolean, default: nil
  end
end
