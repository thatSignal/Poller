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

  has_one(
    :author,
    :through => :poll,
    :source => :author
  )

  def results #responses

    # choices.select("choices.*, COUNT(responses.id) AS num_responses")
    #   .joins("LEFT OUTER JOIN responses ON choices.id = responses.choice_id")
    #   .group("choices.id")
    #   .order("num_responses DESC")
    #   .all


    choices = Choice.find_by_sql([<<-SQL, self.id])
      SELECT
        choices.*,
        COUNT(responses.id) AS num_responses
      FROM
        choices
      LEFT OUTER JOIN
        responses ON choices.id = responses.choice_id
      WHERE
        choices.question_id = ?
      GROUP BY
        choices.id
      ORDER BY
        num_responses DESC
    SQL

    results = Hash.new(0)
    choices.each do |choice|
      results[choice.body] = choice.num_responses
    end

    results
  end

end