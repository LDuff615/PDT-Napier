from flask import render_template, jsonify, request
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from .__init__ import home

from ..models import *
engine = create_engine('mysql://root:!Gr0up!@localhost/napierpdt')
Session = sessionmaker(bind = engine)
session = Session()

# home.route - a decorator, which has a URL route as a parameter
# home - the name of the blueprint as specified in app/home/init.py
@home.route('/')
# homepage() view function renders the index.html template
def homepage():
    # return render_template('home/index.html')
    return render_template('index.html')

@home.route('/training')
def training():
    result = session.query(tests).all()
    # result = tests.query.all()
    return render_template('training.html', result=result)

@home.route('/quiz/<chosenquiz>')
def quiz(chosenquiz):
    # results = session.query(questions, q_options).join(test_questions).filter(test_questions.testID == chosenquiz).all()
    # results = session.query(questions, q_options).join(test_questions, questions.questionID == test_questions.questionID).filter(test_questions.testID == chosenquiz)
    # return render_template('quiz.html', results=results, quizNo=chosenquiz)
    Qs = questions.query.join(test_questions, questions.questionID == test_questions.questionID).filter(test_questions.testID == chosenquiz).all()
    Os = q_options.query.join(test_questions, q_options.optionID == test_questions.optionID).filter(test_questions.testID == chosenquiz).all()
    return render_template('quiz.html', qResults=Qs, oResults=Os)

@home.route('/answer/<chosenopt>', methods=['GET', 'POST'])
def answer(chosenopt):
    answer = q_options.query.filter(q_options.optionID == chosenopt).first()

    if answer.correct == 1:
        return jsonify({'result' : 'success', 'opt_ans' : answer.correct})
    else:
        if answer.correct == 0:
            return jsonify({'result' : 'failure', 'opt_ans' : answer.correct})
