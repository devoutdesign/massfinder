class MakeChangesToMasses < ActiveRecord::Migration
  def self.up
    change_table :masses do |t|
      t.rename :time, :start_time
      t.rename :type, :notes
    end
  end

  def self.down
    change_table :masses do |t|
      t.rename :start_time, :time
      t.rename :notes, :type
    end
  end
end
