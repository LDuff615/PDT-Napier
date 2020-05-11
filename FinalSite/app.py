from flask import Flask, render_template, request, redirect, url_for, flash, session, abort
from flask_mysqldb import MySQL
import os
from sqlalchemy.orm import sessionmaker
from tabledef import *

app = Flask(__name__)

#configs to the server
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'pdt_napier' # change database

mysql = MySQL(app)

#-------------------------------------------------------------------------------------------

engine = create_engine('sqlite:///tutorial.db', echo=True) # database


@app.route('/')
def home():
    if not session.get('logged_in'): # if not logged on loads login page
        return render_template('login3.html')
    elif session['adminAccount'] == True and session.get('logged_in'):# if logged in using a admin account loads admin page
        return render_template('AdminHome.html')
    elif session['adminAccount'] == False and session.get('logged_in'):
        return render_template('Home.html') # if logged on loads home page


@app.route('/login', methods=['POST'])
def login():
    POST_USERNAME = str(request.form['username']) # saves username entered in form
    POST_PASSWORD = str(request.form['password']) # saves password entered in form

    Session = sessionmaker(bind=engine) # links to database
    s = Session()
    query = s.query(User).filter(User.username.in_([POST_USERNAME]), User.password.in_([POST_PASSWORD]) ) #looks in database for password and username entered
    result = query.first() #puts the first username and password match in result
    
    if result: #if user name and password found proced
        if request.form['username'] == 'admin' or request.form['username'] == 'dev': # if admin account entered sets admin account to true
            session['logged_in'] = True
            session['adminAccount'] = True
        else:
            session['logged_in'] = True
            session['adminAccount'] = False
    else:
        flash('wrong password!')
    return home()

@app.route("/logout")
def logout():
    session['logged_in'] = False # sets session status to false
    return home()

@app.route("/home", methods=['POST', 'GET'])
def homepage():
    return render_template('Home.html')

@app.route("/AdminHome")
def AdminHome():
    return render_template('AdminHome.html')
#------------------------------------------------------------------------

#users cms
#main display of data from database
@app.route('/index')
def Index():
    if session.get('logged_in') and session['adminAccount']==True:
        cur = mysql.connection.cursor()
        cur.execute("SELECT  * FROM users")
        data = cur.fetchall()
        cur.close()
        return render_template('index2.html', users=data )
    else:
        return render_template('login3.html')  

#input users data into database
@app.route('/insert', methods = ['POST'])
def insert():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == "POST":
            flash("Data Inserted Successfully")
            username = request.form['username']
            password = request.form['password']
            types = request.form['type']
            score = request.form['score']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO users (username, password, type,score) VALUES (%s, %s, %s, %s)", (username, password, types,score))
            mysql.connection.commit()
            return redirect(url_for('Index'))
    else:
        return render_template('login3.html')


#delete data from database
@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    if session.get('logged_in') and session['adminAccount']==True:
        flash("Record Has Been Deleted Successfully")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM users WHERE userID=%s", (id_data,))
        mysql.connection.commit()
        return redirect(url_for('Index'))
    else:
        return render_template('login3.html')

#edit data from database
@app.route('/update',methods=['POST','GET'])
def update():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == 'POST':
            id_data = request.form['userID']
            username = request.form['username']
            password = request.form['password']
            types = request.form['type']
            score = request.form['score']
            cur = mysql.connection.cursor()
            cur.execute("""
                    UPDATE users
                    SET username=%s, password=%s, type=%s, score=%s
                    WHERE userID=%s
                """, (username, password, types, score, id_data))
            flash("Data Updated Successfully")
            mysql.connection.commit()
            return redirect(url_for('Index'))
    else:
        return render_template('login3.html')
#end of users table cms

#question options cms
#main display of data from database
@app.route('/test')
def test():
    if session.get('logged_in') and session['adminAccount']==True:
        cur = mysql.connection.cursor()
        cur.execute("SELECT  * FROM options")
        data = cur.fetchall()
        cur.close()
        return render_template('test.html', options=data )
    else:
        return render_template('login3.html')


#input response data into database
@app.route('/insert1', methods = ['POST'])
def insert1():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == "POST":
            flash("Data Inserted Successfully")
            description = request.form['description']
            questionID  = request.form['questionID ']
            correct = request.form['correct']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO options (description, questionID , correct) VALUES ( %s, %s, %s)", (description, questionID , correct))
            mysql.connection.commit()
        return redirect(url_for('test'))
    else:
        return render_template('login3.html')


#delete data from database
@app.route('/delete1/<string:id_data>', methods = ['GET'])
def delete1(id_data):
    if session.get('logged_in') and session['adminAccount']==True:
        flash("Record Has Been Deleted Successfully")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM options WHERE optionID =%s", (id_data,))
        mysql.connection.commit()
        return redirect(url_for('test'))
    else:
        return render_template('login3.html')
#edit data from database
@app.route('/update1',methods=['POST','GET'])
def update1():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == 'POST':
            id_data = request.form['optionID ']
            description = request.form['description']
            questionID  = request.form['questionID ']
            correct = request.form['correct']
            cur = mysql.connection.cursor()
            cur.execute("""
                    UPDATE options
                    SET description=%s, questionID =%s, correct=%s
                    WHERE optionID =%s
                    """, (description, questionID , correct, id_data))
            flash("Data Updated Successfully")
            mysql.connection.commit()
            return redirect(url_for('test'))
    else:
        return render_template('login3.html')
#end of options table cms


#questions cms
#main display of data from database
@app.route('/questions')
def questions():
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM questions")
    data = cur.fetchall()
    cur.close()
    return render_template('questions.html', questions=data )


#input users data into database
@app.route('/insert2', methods = ['POST'])
def insert2():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        description = request.form['description']
        questionTitle = request.form['questionTitle']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO questions (questionTitle, description) VALUES ( %s, %s)", (questionTitle, description))
        mysql.connection.commit()
        return redirect(url_for('questions'))



#delete data from database however you need to delete all repospe link to questionID  first
@app.route('/delete2/<string:id_data>', methods = ['GET'])
def delete2(id_data):
    if session.get('logged_in') and session['adminAccount']==True:
        flash("Record Has Been Deleted Successfully")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM questions WHERE questionID=%s", (id_data))
        mysql.connection.commit()
        return redirect(url_for('questions'))
    else:
        return render_template('login3.html')

#edit data from database
@app.route('/update2',methods=['POST','GET'])
def update2():

    if request.method == 'POST':
        id_data = request.form['questionID ']
        questionTitle = request.form['questionTitle']
        description = request.form['description']
        cur = mysql.connection.cursor()
        cur.execute("""
               UPDATE questions
               SET questionTitle=%s, description=%s
               WHERE questionID =%s
            """, (questionTitle, description, id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('questions'))
#end of questions table cms


#reference cms
#main display of data from database
@app.route('/data')
def feedback():
    if session.get('logged_in') and session['adminAccount']==True:
        cur = mysql.connection.cursor()
        cur.execute("SELECT  * FROM refs")
        data = cur.fetchall()
        cur.close()
        return render_template('feedback.html', reference=data )
    else:
        return render_template('login3.html')


#input reference data into database
@app.route('/insert3', methods = ['POST'])
def insert3():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == "POST":
            flash("Data Inserted Successfully")
            referenceLink = request.form['referenceLink']
            questionID = request.form['questionID']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO refs (referenceLink, questionID) VALUES ( %s, %s)", (referenceLink, questionID))
            mysql.connection.commit()
            return redirect(url_for('feedback'))
    else:
        return render_template('login3.html')



#delete data from database
@app.route('/delete3/<string:id_data>', methods = ['GET'])
def delete3(id_data):
    if session.get('logged_in') and session['adminAccount']==True:
        flash("Record Has Been Deleted Successfully")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM refs WHERE referenceID=%s", (id_data,))
        mysql.connection.commit()
        return redirect(url_for('feedback'))
    else:
        return render_template('login3.html')

#edit data from database
@app.route('/update3',methods=['POST','GET'])
def update3():
    if session.get('logged_in') and session['adminAccount']==True:
        if request.method == 'POST':
            id_data = request.form['referenceID']
            referenceLink = request.form['referenceLink']
            questionID = request.form['questionID']
            cur = mysql.connection.cursor()
            cur.execute("""
                    UPDATE refs
                    SET referenceLink=%s,  questionID=%s
                    WHERE referenceID=%s
                """, (referenceLink, questionID, id_data))
            flash("Data Updated Successfully")
            mysql.connection.commit()
            return redirect(url_for('feedback'))
    else:
        return render_template('login3.html')
#end of reference table cms

@app.route('/back')
def back():
    if session['adminAccount'] == True and session.get('logged_in'):
        return render_template('AdminHome.html')
    elif session['adminAccount'] == False and session.get('logged_in'):
        return render_template('Home.html')

# training() view function renders the training.html template
@app.route('/training')
def training():
    if session.get('logged_in'):

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM tests")
        result = cur.fetchall()
        cur.close()
        return render_template('training.html', result=result)
    else:
        return render_template('login3.html')

# quiz() view function will retrieve questions and options from database, relating to the test ID passed in as the parameter 'chosenquiz'
@app.route('/quiz/<chosenquiz>')
def quiz(chosenquiz):
    if session.get('logged_in'):
        cur = mysql.connection.cursor()
        cur.execute("""SELECT DISTINCT questions.questionID, questions.description FROM questions INNER JOIN test_questions ON test_questions.questionID=questions.questionID WHERE test_questions.testID=%s""", (chosenquiz))
        Qs = cur.fetchall()
        cur.close()
        cur = mysql.connection.cursor()
        cur.execute("""SELECT * FROM options""")
        Os = cur.fetchall()
        cur.close()
        cur = mysql.connection.cursor()
        cur.execute("""SELECT * FROM refs""")
        ref = cur.fetchall()
        cur.close()
        #Qs = questions.query.join(test_questions, questions.questionID == test_questions.questionID).filter(test_questions.testID == chosenquiz).all()
        #Os = options.query.join(test_questions, options.optionID == test_questions.optionID).filter(test_questions.testID == chosenquiz).all()
        return render_template('quiz.html', qResults=Qs, oResults=Os, testNo=chosenquiz, ref=ref)
    else: 
        return render_template('login3.html')

@app.route('/score')
def score():
    return render_template('score.html')


#runs the programs
if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True)