class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :created_at
end
