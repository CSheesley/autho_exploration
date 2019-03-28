require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'as a visitor to the website' do
    context 'after clicking on the Create User link' do
      it 'creates an account after providing (full name, email, and password)' do

        visit root_path

        click_on "Create User"

        fill_in user[name], with: "Corey Sheesley"
        fill_in user[email], with: "sample.email@gmail.com"
        fill_in user[password], with: "abcd1234"

        corey = User.last

        expect(corey.name).to eq("Corey Sheesley")
        expect(corey.email).to eq("sample.email@gmail.com")
        expect(corey.password).to eq("abcd1234")
      end
    end
  end
end
