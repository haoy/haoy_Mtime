class MovieComment < ActiveRecord::Base
  attr_accessible :comment, :movie
  belongs_to :user

  validates :movie, presence: true, length: { maximum: 140 }
  validates :comment, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'movie_comments.created_at DESC'
end
