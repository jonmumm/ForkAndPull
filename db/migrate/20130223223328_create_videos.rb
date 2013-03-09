class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.string :title
      t.text :description
      t.string :slug
      t.attachment :preview

      t.timestamps
    end

    add_index :videos, :slug, unique: true
  end
end
