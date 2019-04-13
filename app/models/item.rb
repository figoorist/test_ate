class Item < ApplicationRecord
	before_create :create_slug

	belongs_to :category

	# validation
  	validates_with ItemValidator

	def create_slug
		if !self.slug.present?
	    	self.slug = self.name.parameterize
	    end
	end
end
