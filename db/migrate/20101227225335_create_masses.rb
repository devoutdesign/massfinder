class CreateMasses < ActiveRecord::Migration
  def self.up
    create_table :masses do |t|
      t.string :day
      t.string :time
      t.string :type
      t.references :parish
      t.timestamps
    end
  end

  def self.down
    drop_table :masses
  end
end
