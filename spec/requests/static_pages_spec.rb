require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: "Blog2Kindle") }
    it { should have_selector('h1',    text: "Blog Posts to Kindle") }
    it { should have_selector('p',     text: "Download posts from your" )} 

    pending { should have_link('Sign in', href: signin_path ) }
    it { should have_link('Sign up', href: signup_path ) }

    it "should have the correct layout links" do
      visit root_path
      click_link 'About'
      page.should have_selector('title', text: 'About')
      click_link 'Home'
      page.should have_selector('title', text: 'Blog2Kindle')
    end
  end
end
