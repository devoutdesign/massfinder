class AddLongitudeAndLatitudeToParishes < ActiveRecord::Migration
  def self.up
    add_column :parishes, :longitude, :decimal
    add_column :parishes, :latitude, :decimal
  end

  def self.down
    remove_column :parishes, :latitude
    remove_column :parishes, :longitude
  end
end
