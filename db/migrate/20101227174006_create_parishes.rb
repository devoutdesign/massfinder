class CreateParishes < ActiveRecord::Migration
  def self.up
    create_table :parishes do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :mailing_address
      t.string :phone
      t.string :website
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :parishes
  end
end
