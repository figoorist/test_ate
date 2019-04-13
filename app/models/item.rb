class Item < ApplicationRecord
	before_create :create_slug

	belongs_to :category
	validates :name, presence: true
	validates :category_id, presence: true

	def create_slug
	    self.slug = self.name.parameterize
	end
end
