require 'rails_helper'

  describe "the signin process" do
    it "signs a user in who uses the right password" do
      user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      visit '/login'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log In'
      expect(page).to have_content 'QAA'
    end

    it "gives a user an error who uses the wrong password" do
      visit '/login'
      user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'wrong'
      click_button 'Log In'
      expect(page).to have_content 'Log In'
    end

    it "allows a user to sign up" do
      visit '/signup'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content 'QAA'
    end

    it "will not allow a user to sign up" do
      visit '/signup'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: ''
      click_button 'Sign Up'
      expect(page).to have_content 'Access Denied'
    end


    it "will successfully log out a user" do
      user1 = User.create(email: 'user@email.com', password: 'testpassword', :password_confirmation => 'testpassword')
      visit '/login'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'testpassword'
      click_button 'Log In'
      click_link 'Log Out'
      expect(page).to have_content 'QAA'
    end
  end
