class CreateBrewery < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.timestamps
    end
  end
end
