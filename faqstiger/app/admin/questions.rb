ActiveAdmin.register Question do
  # Specify parameters which should be permitted for assignment
  permit_params :question, :category_id, :answer

  # or consider:
  #
  # permit_params do
  #   permitted = [:question, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :category
  filter :question
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :category
    column :question
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :category
      row :question
      # row :answer.body.to_s
      row :answer do |a|
        a.answer.body.to_s
      end
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :category
      f.input :question
      f.rich_textarea :answer
    end
    f.actions
  end
end
