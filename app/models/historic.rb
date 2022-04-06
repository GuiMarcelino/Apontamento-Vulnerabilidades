class Historic < ApplicationRecord
  belongs_to :created_by, class_name: '::User', required: false
  belongs_to :updated_by, class_name: '::User', required: false
end