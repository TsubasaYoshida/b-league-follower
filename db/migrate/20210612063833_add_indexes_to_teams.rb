class AddIndexesToTeams < ActiveRecord::Migration[6.1]
  def change
    add_index :teams, :name, unique: true
    add_index :teams, :short_name, unique: true
    add_index :teams, :twitter_user_id, unique: true
  end
end
