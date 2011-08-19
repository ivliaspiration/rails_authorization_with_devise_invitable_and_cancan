class AddUserIdToComment < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.references :user
    end

  end

  def self.down

  end
end
