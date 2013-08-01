class User < ActiveRecord::Base
  attr_accessible :username, :email

  validates :username, :email, :presence => true

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

  def create_poll(title, description)
    Poll.create!(
      :title => title,
      :description => description,
      :author_id => self.id
    )
  end

  def add_question_to_poll(poll_id, body)
    poll = Poll.find(poll_id)
    raise "not your poll!" if poll.author != self
    Question.create!(:poll_id => poll.id, :body => body)
  end

  def add_choice_to_question(question_id, body)
    question = Question.find(question_id)
    raise "not your question!" if question.author != self
    Choice.create!(:question_id => question.id, :body => body)
  end


  ### create responses
  ### validate one response per user per question

end
