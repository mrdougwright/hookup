class User < ActiveRecord::Base
  class SelfLike < StandardError; end
  attr_accessible :email, :name 

  def likes
    User.where(id: Like.crush_ids_for(self))
  end

  def like(user)
    raise SelfLike if user == self
    Like.create_link(self, user)
  end

  def likes?(user)
    likes.include? user
  end
end
