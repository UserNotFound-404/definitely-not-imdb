class AddRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :ratings

      t.timestamps
    end
    change_column :movies, :ratings, :float
    rename_column :movies, :ratings, :default_rating
  end
end
