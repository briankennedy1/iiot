class AddDateToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :air_date, :time
  end
end
