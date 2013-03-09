class Video < ActiveRecord::Base
  attr_accessible :description, :title, :youtube_id, :category_ids, :preview, :gist_url, :resources_attributes

  has_and_belongs_to_many :categories
  has_attached_file :preview, :styles => { :retina_medium => "616x", :medium => "308x", :retina_thumb => "200x", :thumb => "100x" }

  has_many :resources

  accepts_nested_attributes_for :resources, :allow_destroy => true

  validates_presence_of :description, :title, :youtube_id, :preview, :gist_url

  extend FriendlyId
  friendly_id :title, use: :slugged
end
