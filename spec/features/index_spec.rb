require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'as a visitor to the website' do
    context 'after clicking on the Create User link' do
      it 'creates an account after providing (full name, email, and password)' do

        visit root_path

        click_on "Register"
        expect(current_path).to eq(new_user_path)

        fill_in "user[name]", with: "Corey Sheesley"
        fill_in "user[email]", with: "sample.email@gmail.com"
        fill_in "user[password]", with: "abcd1234"

        click_on "Create User"
        expect(current_path).to eq(root_path)

        corey = User.last

        expect(corey.name).to eq("Corey Sheesley")
        expect(corey.email).to eq("sample.email@gmail.com")
        expect(corey.password).to eq("abcd1234")
      end

      it 'should show a button which can be clicked on to be logged in' do
        user = User.create(name: "Corey Sheesley", email: "sample.email@gmail.com", password: "abcd1234")

        visit root_path

        click_on "Log In"

        expect(current_path).to eq(login_path)

        fill_in "session[email]", with: user.email
        fill_in "session[password]", with: user.password

        click_on "Log In"

        expect(current_path).to eq(user_path(user))
      end
    end
  end
end
