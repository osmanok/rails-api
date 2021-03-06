class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :requestable_type
      t.integer :method

      t.timestamps
    end
  end
end
