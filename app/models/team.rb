class Team < ActiveRecord::Base
  attr_accessible :name

  has_many(
    :team_members,
    :class_name => "User",
    :foreign_key => :team_id,
    :primary_key => :id
  )

  has_many(
  :polls,
  :through => :team_members,
  :source => :polls
  )

end
