ActiveAdmin.register Category do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.inputs "Video Details" do
      f.input :name
    end
    f.actions
  end
end
