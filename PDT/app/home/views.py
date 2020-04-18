# This file will provide the view functions to connect to each HTML page
# Importing modules from flask & SQLAlchemy packages
from flask import render_template
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Importing home blueprint from __init__.py
from .__init__ import home

# Importing every db model from app/models.py
from ..models import *

# Creating a connection to MySQL database
engine = create_engine('mysql://root:!Gr0up!@localhost/napierpdt')
Session = sessionmaker(bind = engine)
session = Session()

# home.route - a decorator, which has a URL route as a parameter
# home - the name of the blueprint as specified in app/home/init.py
@home.route('/')
@home.route('/home')
@home.route('/index')
# homepage() view function renders the index.html template
def homepage():
    return render_template('index.html')

# training() view function renders the training.html template
@home.route('/training')
def training():
    result = session.query(tests).all()
    return render_template('training.html', result=result)

# quiz() view function will retreive questions and options from database, relating to the test ID passed in as the parameter 'chosenquiz'
@home.route('/quiz/<chosenquiz>')
def quiz(chosenquiz):
    Qs = questions.query.join(test_questions, questions.questionID == test_questions.questionID).filter(test_questions.testID == chosenquiz).all()
    Os = q_options.query.join(test_questions, q_options.optionID == test_questions.optionID).filter(test_questions.testID == chosenquiz).all()
    return render_template('quiz.html', qResults=Qs, oResults=Os)