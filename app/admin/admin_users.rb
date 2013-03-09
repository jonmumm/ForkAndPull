ActiveAdmin.register AdminUser do
  index do
    column :email
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
    end
    f.buttons
  end
end
