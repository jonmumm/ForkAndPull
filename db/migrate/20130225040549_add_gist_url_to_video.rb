class AddGistUrlToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :gist_url, :string
  end
end
