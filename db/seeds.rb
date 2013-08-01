# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
            {username: "thatsignal", email: "student@appacademy.io"},
            {username: "osiris", email: "osiris@yahoo.com"},
            {username: "bobby", email: "robert@microoft.com"}
          ])

polls = Poll.create([
            {title: "reality",
                description: "???",
                author_id: 1},
            {title: "who am I?",
                description: "thatsignal couldn't remember, and ben is ignorant",
                author_id: 2}
              ])

questions = Question.create([
            {poll_id: 1, body: "What is reality?"},
            {poll_id: 1, body: "what happens in a black hole?"},
            {poll_id: 2, body: "What am I the god of?"},
            {poll_id: 2, body: "Where is anubis?"}
          ])

choices = Choice.create([
            {question_id: 1, body: "everything is virtual"},
            {question_id: 1, body: "mind and matter"},
            {question_id: 1, body: "apple products"},
            {question_id: 2, body: "another black hole"}
          ])

responses = Response.create([
            {choice_id: 3, responder_id: 3},
            {choice_id: 2, responder_id: 2},
            {choice_id: 4, responder_id: 1},
            {choice_id: 4, responder_id: 3}
        ])



