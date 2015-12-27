class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :debut_year
      t.string :slug
      t.integer :trakt_id
      t.string :imdb_id
      t.integer :tmdb_id
      t.integer :tvrage_id

      t.timestamps null: false
    end
  end
end
