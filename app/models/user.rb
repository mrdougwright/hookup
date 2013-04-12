class User < ActiveRecord::Base
  class SelfLike < StandardError; end
  attr_accessible :email, :name 

  def likes
    array_likes = Like.where(user_id: self.id)
    User.where(id: array_likes.collect(&:crush))
  end

  def like(user)
    raise SelfLike if user == self
    Like.create({ user_id: self.id, crush: user.id })
  end

  def likes?(user)
    likes.include? user
  end
end
