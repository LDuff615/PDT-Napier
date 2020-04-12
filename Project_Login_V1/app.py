from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
import os

app = Flask(__name__)

# home function
@app.route('/')
def home():
	if not session.get('logged_in'): # if not logged on loads login page
		return render_template('login.html')
	else:
		return render_template('home.html') # if logged on loads home page

#Login funrtion
@app.route('/login', methods=['POST'])
def login():
	if request.form['password'] == 'password' and request.form['username'] == 'admin':  
		session['logged_in'] = True #if the correct username and password are entered sets session to true
	else:
		flash('wrong username or password')
	return home()

#Logout funtion
@app.route("/logout")
def logout():
	session['logged_in'] = False # sets session status to false
	return home()

#boiler plate
if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True) # runs debug mode for testing 