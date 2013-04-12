class Like < ActiveRecord::Base
	attr_accessible :crush, :user_id

	def self.create_link(user, crush)
		create({user_id: user.id, crush: crush.id })
	end

  def self.crush_ids_for(user)
  	where(user_id: user.id).map(&:crush)
  end
end
