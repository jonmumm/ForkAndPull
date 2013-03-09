ActiveAdmin.register Video do
  index do
    column :title
    column :created_at
    default_actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs "Video Details" do
      f.input :title
      f.input :description
      f.input :youtube_id
      f.input :preview
      f.input :categories
      f.input :gist_url

      f.inputs "Resources" do
        f.has_many :resources do |r|
          r.input :name
          r.input :url
          r.input :_destroy, :as => :boolean, :required => false, :label => "Remove resource"
        end
      end
    end

    f.actions
  end
end
