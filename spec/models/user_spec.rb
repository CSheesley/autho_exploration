require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }

    it 'will not create a user if invalid information is given' do
      user_1 = User.create(name: "Corey Sheesley", email: "sample.email@gmail.com", password: "abcd1234" )
      user_2 = User.create(name: "Tommy Otherguy", email: "sample.email@gmail.com", password: "1234abcd" )
      user_3 = User.create(name: "Corey Sheesley", email: "sample.email@gmail.com", password: "abcd" )

      expect(User.count).to eq(1)
    end
  end

  describe 'class methods' do
    it '.authenticate' do
      user = User.create(name: "Corey Sheesley", email: "sample.email@gmail.com", password: "abcd1234")

      expect(User.authenticate("sample.email@gmail.com", "abcd1234")).to eq(user)
      expect(User.authenticate("sample.email@gmail.com", "sfajdfkj")).to eq(nil)
    end
  end
end
