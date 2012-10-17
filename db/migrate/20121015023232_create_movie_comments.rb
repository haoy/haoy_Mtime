class CreateMovieComments < ActiveRecord::Migration
  def change
    create_table :movie_comments do |t|
      t.string :movie
      t.string :comment
      t.integer :user_id

      t.timestamps
    end
    add_index :movie_comments, [:user_id, :created_at]
  end
end
