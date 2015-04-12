class User < ActiveRecord::Base

  validates_presence_of :trigram
  validates_uniqueness_of :trigram, case_sensitive: false

  after_create :set_token, :uppercase_trigram

  private

  def set_token
    begin
      temp_token = SecureRandom.hex.to_s
    end while self.class.exists?(token: temp_token)

    self.update_attribute(:token, temp_token)
  end

  def uppercase_trigram
    self.update_attribute(:trigram, self.trigram.upcase)
  end
end
