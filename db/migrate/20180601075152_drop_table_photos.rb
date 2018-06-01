class DropTablePhotos < ActiveRecord::Migration[5.1]
  def up
  	drop_table :photos
  end

  def down
  	fail ActiveRecord::IrreversibleMigration
  end

end
