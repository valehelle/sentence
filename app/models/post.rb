class Post < ApplicationRecord
  belongs_to :noun, :class_name => 'User'
  belongs_to :adjective
  belongs_to :verb
  belongs_to :recipient, :class_name => 'User'
end
