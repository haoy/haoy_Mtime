require 'spec_helper'

describe "MovieComment pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "movie_comment creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a movie_comment" do
        expect { click_button "Post" }.not_to change(MovieComment, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'movie_comment_movie', with: "Lorem ipsum" }
      before { fill_in 'movie_comment_comment', with: "Lorem ipsum" }
      it "should create a movie_comment" do
        expect { click_button "Post" }.to change(MovieComment, :count).by(1)
      end
    end
  end

  describe "movie_comment destruction" do
    before { FactoryGirl.create(:movie_comment, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a movie_comment" do
        expect { click_link "delete" }.to change(MovieComment, :count).by(-1)
      end
    end
  end

end
