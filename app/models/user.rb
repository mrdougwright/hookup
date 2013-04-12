class User < ActiveRecord::Base
  class SelfLike < StandardError; end
  attr_accessible :email, :name 
  attr_accessor :likes

  after_initialize :init_likes
  
  def init_likes
    @likes = []
  end

  def like(user)
    raise SelfLike if user == self
    @likes << user
  end

  def likes?(user)
    likes.include?(user)
  end
end
