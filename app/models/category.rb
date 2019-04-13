class Category < ApplicationRecord
	before_create :create_slug

	has_ancestry
	has_many :items
	
	# validation
  	validates_with CategoryValidator

	def create_slug
	    if !self.slug.present?
	    	self.slug = self.name.parameterize
	    end
	end
end
