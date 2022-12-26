ActiveAdmin.register Movie do
	permit_params :title, :body, :default_rating, :category, :image

	form do |f|
    f.inputs do
      f.input :title, required: true
      f.input :body
      f.input :default_rating
      f.input :category, required: true
      f.input :image, as: :file, required: true
    end
    f.actions
  end

end

