class Poll < ActiveRecord::Base
  attr_accessible :title, :description, :author_id

  validates :title, :author_id, :presence => true

  belongs_to(
    :author,
    :class_name => "User",
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :questions,
    :class_name => "Question",
    :foreign_key => :poll_id,
    :primary_key => :id,
    :dependent => :destroy
  )

  has_many(
    :responders,
    :through => :questions,
    :source => :responders
  )

  has_one(
    :team,
    :through => :author,
    :source => :team
  )


end
