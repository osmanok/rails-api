class AddVoteToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :vote, :integer, :default => 0
  end
end
