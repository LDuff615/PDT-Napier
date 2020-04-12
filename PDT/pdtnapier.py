#Importing all required modules from the Flask package
from flask import Flask, url_for, render_template, redirect

#Importing PyMSQL as the interface to connect to the MySQL database
import pymysql as mdb
#import MySQLdb as mdb

#Importing the flask-sqlalchemy module from the Flask package
from flask_sqlalchemy import SQLAlchemy

#app variable initialisation
app = Flask(__name__)
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:!Gr0upPDT!@localhost/napierpdt'

#db variable initialisation
db = SQLAlchemy(app)

#Establishing connection to MySQL database
con = mdb.connect('localhost', 'root', '!Gr0upPDT!', 'napierpdt')

#These routes will take users to the Home Page
@app.route('/')
@app.route('/home')
def home():
    return render_template('home/index.html')

#This route will take users to the Training Page, where they can select a test to begin their PDT training
@app.route('/training')
def training():
    cur = con.cursor()
    cur.execute("SELECT * FROM tests")
    quizzes = cur.fetchall()
    return render_template('home/app/templates/training.html', data=quizzes)

#This route will take a user to the Quiz Page, where they can begin answering questions related to the quiz they selected in the Training Page
@app.route('/quiz/<chosenquiz>')
def quiz(chosenquiz):
    selectedtest = chosenquiz
    cur = con.cursor()
    #cur.execute("SELECT * FROM test_questions WHERE testID = %s", selectedtest)
    #cur.execute("SELECT questions.description, q_options.description FROM test_questions INNER JOIN questions ON test_questions.questionID = questions.questionID INNER JOIN q_options ON test_questions.optionID = q_options.optionID WHERE test_questions.testID = %s", selectedtest)

    return redirect(url_for('quiz'))

#Run Flask Application with debug mode on
if __name__ == '__main__':
    app.run(debug=True)
