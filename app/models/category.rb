class Category < ApplicationRecord
	before_create :create_slug

	has_ancestry
	has_many :items
	validates :name, presence: true

	def create_slug
	    self.slug = self.name.parameterize
	end
end
