class RemoveSlug < ActiveRecord::Migration
  def change
    remove_column :shows, :slug
  end
end
