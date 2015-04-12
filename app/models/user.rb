class User < ActiveRecord::Base

  validates :trigram, presence: true, uniqueness: true

  after_create :set_token

  private

  def set_token
    begin
      temp_token = SecureRandom.hex.to_s
    end while self.class.exists?(token: temp_token)

    self.update_attribute(:token, temp_token)
  end

end
