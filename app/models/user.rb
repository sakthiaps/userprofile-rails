class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile_number, :numericality => true, :length => { :minimum => 10, :maximum => 15 }, if: -> {mobile_number.present?}

  def generate_token
    AuthToken.issue_token({user_id: id, exp: 1.days.from_now.to_i})
  end
end