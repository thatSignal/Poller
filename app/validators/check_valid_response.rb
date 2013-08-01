class CheckValidResponse < ActiveModel::Validator
  def validate(record)
    question = record.question

    if question.author == record.responder
      record.errors[:responder_id] << "Can not respond to your own poll."
    end

    if question.responders.include?(record.responder)
      record.errors[:responder_id] << "Can not respond twice to a question."
    end


  end
end