require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }    
      it { should have_selector('h1',        text: 'Share') }
      it { should have_selector('title',     text: full_title('')) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:movie_comment, user: user, movie: "Lorem ipsum", comment: "Lorem ipsum")
        FactoryGirl.create(:movie_comment, user: user, movie: "Dolor sit amet",comment: "Dolor sit amet" )
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.movie)
          page.should have_selector("li##{item.id}", text: item.comment)
        end
      end
    end
  end

  describe "Tour page" do
      before { visit tour_path }
      it { should have_selector('h1',    text: 'Users') }
      it { should have_selector('title', text: full_title('Users Comments')) }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About the Website')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }	  
    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }   
  end

end




