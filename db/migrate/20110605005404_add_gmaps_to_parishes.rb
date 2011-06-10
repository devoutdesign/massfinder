class AddGmapsToParishes < ActiveRecord::Migration
  def self.up
    add_column :parishes, :gmaps, :boolean
  end

  def self.down
    remove_column :parishes, :gmaps
  end
end
