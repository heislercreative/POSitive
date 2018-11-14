ActiveAdmin.register User do
  permit_params :email, :password_digest, :business_name
end
