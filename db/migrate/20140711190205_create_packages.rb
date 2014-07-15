class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :trade
    end
  end
end
