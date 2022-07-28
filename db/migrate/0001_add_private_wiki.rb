class AddPrivateWiki < ActiveRecord::Migration[5.1]
 
  def self.up
    add_column(:wiki_pages, "private", :boolean, :default => true)
  end

  def self.down
    remove_column(:wiki_pages, "private")
  end
end
