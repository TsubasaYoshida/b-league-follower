class AddLeagueToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :league, :string, null: false, default: ''
  end
end
