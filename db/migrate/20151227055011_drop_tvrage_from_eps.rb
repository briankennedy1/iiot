class DropTvrageFromEps < ActiveRecord::Migration
  def change
    remove_column :episodes, :tvrage_id
    add_column :episodes, :tvdb_id, :integer
    add_column :shows, :tvdb_id, :integer
  end
end
