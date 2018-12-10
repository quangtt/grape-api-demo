class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :done, if: -> { false }
  attribute :created_at do
    object.created_at.strftime '%Y-%m-%d %H:%M:%S'
  end
end
