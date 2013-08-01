class Question < ActiveRecord::Base
  attr_accessible :body, :poll_id

  validates :body, :poll_id, :presence => true

  belongs_to(
    :poll,
    :class_name => "Poll",
    :foreign_key => :poll_id,
    :primary_key => :id
  )

  has_many(
    :choices,
    :class_name => "Choice",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  has_many(
    :responders,
    :through => :choices,
    :source => :responders
  )
end
