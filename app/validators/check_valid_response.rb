class CheckValidResponse < ActiveModel::Validator
  def validate(response)
    question = response.question

    if question.author == response.responder
      response.errors[:responder_id] << "Can not respond to your own poll."
    end

    if question.responders.include?(response.responder)
      response.errors[:responder_id] << "Can not respond twice to a question."
    end

    unless question.team == response.responder.team
      response.errors[:responder_id] << "Cannot vote on another team's poll!"
    end
  end
end