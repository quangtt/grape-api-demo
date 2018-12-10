class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_by
  has_many :items
end
