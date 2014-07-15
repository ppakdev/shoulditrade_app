class CreatePackagesPlayers < ActiveRecord::Migration
  def change
    create_table :packages_players, id: false do |t|
      t.references :package
      t.references :player
    end
  end
end
