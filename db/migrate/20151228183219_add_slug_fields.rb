class AddSlugFields < ActiveRecord::Migration
  def change
    add_column :episodes, :slug, :string
    add_column :shows, :slug, :string
  end
end
