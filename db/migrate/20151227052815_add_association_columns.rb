class AddAssociationColumns < ActiveRecord::Migration
  def change
    add_column :episodes, :show_id, :string
  end
end
