class Response < ActiveRecord::Base
  attr_accessible :choice_id, :responder_id

  validates :choice_id, :responder_id, :presence => true
  validates_with CheckValidResponse
  # validates :responder_id, :uniqueness => { :scope => :choice_id, :message => "cant vote twice" }

  belongs_to(
    :responder,
    :class_name => "User",
    :foreign_key => :responder_id,
    :primary_key => :id
  )

  belongs_to(
    :choice,
    :class_name => "Choice",
    :foreign_key => :choice_id,
    :primary_key => :id
  )

  has_one(
    :question,
    :through => :choice,
    :source => :question
  )

  has_one(
    :responder_team,
    :through => :responder,
    :source => :team
  )
end
