class StaticPagesController < ApplicationController
  def home
    @movie_comment = current_user.movie_comments.build if signed_in?
    if signed_in?
      @movie_comment = current_user.movie_comments.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10 )
    end
  end

  def tour

  end

  def contact
  end

  def about
  end
end
