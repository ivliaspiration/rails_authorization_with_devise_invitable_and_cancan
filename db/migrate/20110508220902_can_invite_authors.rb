class CanInviteAuthors < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.invitable
      t.index :invitation_token
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :invitation_token, :invitation_sent_at
      t.remove_index :invitation_token
    end
  end
end
