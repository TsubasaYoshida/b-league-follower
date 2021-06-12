class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :screen_name, null: false
      t.string :short_name, null: false

      t.timestamps
    end
    add_index :teams, :screen_name, unique: true
  end
end
