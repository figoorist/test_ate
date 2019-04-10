module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Магазин загогулин"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def image_filepath(item)
  	if item.image.present?
  		"illustrations/" + item.image
  	else
  		"flourish.png"
  	end
  end
end
