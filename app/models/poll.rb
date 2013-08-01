class Poll < ActiveRecord::Base
  attr_accessible :title, :description, :author_id


  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :questions,
    :class_name => "Question",
    :foreign_key => :poll_id,
    :primary_key => :id
  )

  has_many(
    :responders,
    :through => :questions,
    :source => :responders
  )


end
