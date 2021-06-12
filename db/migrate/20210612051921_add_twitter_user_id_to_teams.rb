class AddTwitterUserIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :twitter_user_id, :string, null: false
  end
end
