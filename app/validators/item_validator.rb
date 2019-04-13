class ItemValidator < ActiveModel::Validator
  def validate(record)
    if !record.name.present?
      record.errors[:name] << 'must be given'
    end

    if !record.category_id.present?
      	record.errors[:category_id] << 'must be given'
    end

    if record.slug.present? 
    	if !record.slug.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
    		record.errors[:slug] << 'please enter slug in correct format'
    	end
    	if record.slug.length > 30
    		record.errors[:slug] << 'length too long'
    	end
    end
  end
end