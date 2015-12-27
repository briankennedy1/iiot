class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :number
      t.integer :season
      t.integer :trakt_id
      t.string :imdb_id
      t.integer :tmdb_id
      t.integer :tvrage_id

      t.timestamps null: false
    end
  end
end
