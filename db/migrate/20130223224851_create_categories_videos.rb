class CreateCategoriesVideos < ActiveRecord::Migration
  def change
    create_table :categories_videos, :id => false do |t|
      t.references :category, :video
    end

    add_index :categories_videos, [:category_id, :video_id]
    add_index :categories_videos, [:video_id, :category_id]
  end
end
