class RenameUrlFromMovie < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :url, :poster_url
  end
end
