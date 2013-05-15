class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :grade
      t.string :bio
      t.integer :number
	  t.references :roster

      t.timestamps
    end
	
	add_index :players, :roster_id
  end
end
