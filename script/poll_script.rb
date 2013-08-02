class PollScript

  def initialize(username, team)
    @user = User.find_by_username(username) ||
      User.create!({ username: username, team: team })
  end

  def create_poll(title, description)
    poll = Poll.create!({ title: title, description: description, author_id: @user.id })
    get_questions_for_poll(poll)


    p "TITLE: #{poll.title}"
    p "DETAILS: #{poll.description}"
    p "QUESTIONS:"

    poll.questions.includes(:choices).each do |question|
      p question
      p question.choices.map(&)

  end

  def get_questions_for_poll(poll)
    loop do
      puts "enter a question for your poll:"
      input = gets.chomp
      break if input.empty?

      question = Question.create!({ body: input, poll_id: poll.id })
      get_choices_for_question(question)
    end

  end

  def get_choices_for_question(question)
    loop do
      puts "enter a choice for your question:"
      input = gets.chomp
      break if input.empty?

      choice = Choice.create!({ body: input, question_id: question.id })
    end

  end

end #end class