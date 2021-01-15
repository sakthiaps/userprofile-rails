require 'jwt'

module AuthToken
  def self.issue_token payload
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def self.decoded_token_value token
    JWT.decode(token, Rails.application.credentials.secret_key_base).first rescue nil
  end

  def self.valid? token
    self.decoded_token_value(token).present?
  end

  def self.expired?(payload)
    return true if payload && payload['exp'].blank?

    Time.at(payload['exp']) < Time.now
  end

end