class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { within: 6..40 }

  def self.authenticate(email, password)
    if find_by(email: email).password == password
      find_by(email: email)
    end
  end
end
