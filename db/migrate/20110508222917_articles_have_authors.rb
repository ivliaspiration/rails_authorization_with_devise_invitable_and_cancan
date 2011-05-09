class ArticlesHaveAuthors < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.references :author
    end
  end

  def self.down
    remove_column :article, :author_id
  end
end
