class MovieCommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @movie_comment = current_user.movie_comments.build(params[:movie_comment])
    if @movie_comment.save
      flash[:success] = "Movie comment created!"
      redirect_to root_url
    else
    @feed_items = []
    render 'static_pages/home'
    end
  end


  def destroy
    @movie_comment.destroy
    redirect_to root_url
  end

  private

  def correct_user
    @movie_comment = current_user.movie_comments.find_by_id(params[:id])
    redirect_to root_url if @movie_comment.nil?
  end

end