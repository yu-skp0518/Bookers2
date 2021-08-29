class RenameCaptionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :caption, :introduction
  end
end
