class CreateFollowerCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :follower_counts do |t|
      t.integer :count, null: false
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
