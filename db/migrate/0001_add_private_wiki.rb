class AddPrivateWiki < ActiveRecord::Migration
 
  def self.up
    add_column(:wiki_pages, "private", :boolean, :default => true)
  end

  def self.down
    remove_column(:wiki_pages, "private")
  end
end
