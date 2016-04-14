class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role, :api_key
end
