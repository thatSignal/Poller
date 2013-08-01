class Response < ActiveRecord::Base
  attr_accessible :choice_id, :responder_id

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

end
