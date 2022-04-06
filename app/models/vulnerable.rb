class Vulnerable < ApplicationRecord

  enum status_type: { identified: 1, being_analyzed: 2, fixed: 3 }
  enum level_type: { low: 1, medium: 2, high: 3 }

  belongs_to :created_by, class_name: '::User', required: false
  belongs_to :updated_by, class_name: '::User', required: false
  has_many :historics


  before_save :generate_log, on: %i[create update]

  def generate_log
    historics.create(
      created_by_id: created_by_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_historic: status_type

    )
  end
end
