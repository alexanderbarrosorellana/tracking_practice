class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :identifier

      t.timestamps
    end
    add_index :vehicles, :identifier
  end
end
