ActiveAdmin.register User do
  permit_params :trigram

  form do |f|
    f.inputs "User Details" do
      f.input :trigram
    end
    f.actions
  end
end
