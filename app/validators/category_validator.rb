class CategoryValidator < ActiveModel::Validator
  def validate(record)
    if !record.name.present?
      record.errors[:name] << 'must be given'
    end
  end
end