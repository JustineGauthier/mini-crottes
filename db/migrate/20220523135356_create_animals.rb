class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :species
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
