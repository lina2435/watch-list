class RenameMovieDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :description, :overview
  end
end
