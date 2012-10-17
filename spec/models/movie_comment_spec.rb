require 'spec_helper'

describe MovieComment do
  let(:user) { FactoryGirl.create(:user)}
  before { @movie_comment = user.movie_comments.build(movie:"Lorem ipsum",comment:"Lorem ipsum") }

  subject { @movie_comment }

  it { should respond_to(:movie) }
  it { should respond_to(:comment) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }
  describe "when user_id is not present" do
    before { @movie_comment.user_id = nil }
    it { should_not be_valid }
  end
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        MovieComment.new(user_id: user.id)
      end. to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "movie with blank content" do
    before { @movie_comment.movie = " " }
    it { should_not be_valid }
  end

  describe "comment with blank content" do
    before { @movie_comment.comment = " " }
    it { should_not be_valid }
  end

  describe "with movie that is too long" do
    before { @movie_comment.movie = "a" * 41 }
    it { should_not be_valid }
  end

  describe "with comment that is too long" do
    before { @movie_comment.comment = "a" * 141 }
    it { should_not be_valid }
  end

end
