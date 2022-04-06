class Vulnerable < ApplicationRecord

  enum status_type: { identified: 1, being_analyzed: 2, fixed: 3 }
  enum level_type: { low: 1, medium: 2, high: 3 }

  has_many :historics




  before_save :generate_log, on: %i[create update]

  def generate_log

    created_by.historics.create(
      created_by_id: created_by_id,
      created_at: created_at,
      updated_at: updated_at,
      historic_type: historic_type_humanize,

    )
  end
end
