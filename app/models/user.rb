class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :historics


  # Callbacks
  before_validation :set_provider,
                    :set_uid

  # Validations
  validates_presence_of :email, {
    message: :need_email
  }
  validates_uniqueness_of :email,
                          allow_blank: true,
                          conditions: -> { where(active: true, deleted_at: nil) }
  validates_format_of :email,
                      with: /\A[^@\s]+@[^@\s]+\z/,
                      allow_blank: true,
                      if: :email_changed?

  validates_uniqueness_of :uid,
                          scope: :provider,
                          conditions: -> { where(active: true, deleted_at: nil) }

  validates_presence_of :password, if: :password_required?
  validates_length_of :password, within: 6..128, allow_blank: true
  validates_confirmation_of :password, if: :password_required?
  validates_format_of :password,
                      with: /(?=.*[a-z])(?=.*[A-Z])/,
                      message: :invalid_case_format,
                      if: -> { password.present? }
  validates_format_of :password,
                      with: /(?=.*[0-9])/,
                      message: :invalid_number_format,
                      if: -> { password.present? }
  validates_format_of :password,
                      with: /(?=.*[^A-Za-z0-9])/,
                      message: :invalid_special_character,
                      if: -> { password.present? }


  validates :name, presence: true, length: { maximum: 255 }


  protected

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  private

  def set_provider
    self.provider = 'email'
  end

  def set_uid
    self.uid = email
  end



end
