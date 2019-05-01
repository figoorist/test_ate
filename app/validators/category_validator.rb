class CategoryValidator < ActiveModel::Validator
  def validate(record)
  	slug_regex = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/
  	
    if !record.name.present?
      record.errors[:name] << 'must be given'
    end

    if record.slug.present? 
    	if !record.slug.match?(slug_regex)
    		record.errors[:slug] << 'please enter slug in correct format'
    	end
    	if record.slug.length > 30
    		record.errors[:slug] << 'length too long'
    	end
    end
  end
end