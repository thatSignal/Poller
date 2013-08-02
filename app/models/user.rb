class User < ActiveRecord::Base
  attr_accessible :username, :email, :team_id

  validates :username, :email, :team, :presence => true

  has_many(
    :polls,
    :class_name => "Poll",
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :responses,
    :class_name => "Response",
    :foreign_key => :responder_id,
    :primary_key => :id
  )

  has_many(
    :choices,
    :through => :responses,
    :source => :choices
  )

  belongs_to(
    :team,
    :class_name => "Team",
    :foreign_key => :team_id,
    :primary_key => :id
  )

  ### create responses

end
