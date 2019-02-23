class AddVisibleToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :visible, :boolean, default: false
  end
end
