require 'spec_helper'

describe "AdminLogins" do
  it "logs in admin if the right credentials are provided" do
    # As testing db is not the same as development db, there is no
    # admin seeded. Let's create one just the way we did in seeds.rb
    admin = Factory(:admin)
    Admin.confirm_by_token(admin.confirmation_token)
    
    visit new_user_session_path # Path defined by Devise
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => "secret" # This is defined in factories.rb
    click_button "Sign in"
    
    # If we gave right credentials, we should see flash message
    page.should have_content("Signed in successfully.")
    # We also should see current user
    page.should have_content("Hello, #{admin.email}!")
    # Also admin should see Invite User link
    page.should have_content("Invite user")
  end
  
  it "doesn't log in admin if the wrong credentials are given" do
    admin = Factory(:admin)
    Admin.confirm_by_token(admin.confirmation_token)
    
    visit new_user_session_path
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => "wrongpass"
    click_button "Sign in"
    
    page.should have_content("Invalid email or password.")
    page.should_not have_content("Hello, #{admin.email}!")
    page.should_not have_content("Invite user")
  end
end
