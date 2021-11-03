class ChangeDefaultValueToVisible < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :visible, :boolean, default: false
  end

  def down
    change_column :posts, :visible, :boolean, default: true
  end
end
