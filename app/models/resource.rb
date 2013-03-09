class Resource < ActiveRecord::Base
  attr_accessible :name, :url, :video_id

  validates_presence_of :name, :url, :video_id

  belongs_to :video
end
