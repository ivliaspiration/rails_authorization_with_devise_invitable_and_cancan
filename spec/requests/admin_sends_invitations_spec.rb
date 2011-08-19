require 'spec_helper'

describe "AdminSendsInvitations" do
  before(:each) do
    @admin = Factory(:admin)
    Admin.confirm_by_token(@admin.confirmation_token)
    
    visit new_user_session_path
    fill_in "Email", :with => @admin.email
    fill_in "Password", :with => "secret"
    click_button "Sign in"
  end
  
  it "allows admin to send invitations" do
    visit new_user_invitation_path # defined by devise_invitable
    page.should have_content("Send invitation") 
  end
  
  it "actually sends invitations" do
    visit new_user_invitation_path
    fill_in "Email", :with => 'some@email.com'
    click_button "Send an invitation"
    page.should have_content "An invitation email has been sent to some@email.com" 
  end
  
  it "resends invitations to the same email" do
    visit new_user_invitation_path
    fill_in "Email", :with => 'some@email.com'
    click_button "Send an invitation"
    visit new_user_invitation_path
    fill_in "Email", :with => 'some@email.com'
    click_button "Send an invitation"
    page.should have_content "An invitation email has been resent to some@email.com"    
  end
end
