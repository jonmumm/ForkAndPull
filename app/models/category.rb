class Category < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :videos

  validates_presence_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
