# This file will contain the models that will represent the database tables
from app.__init__ import db

# This model will be used to represent the Users table in the MySQL database
class Users(db.Model):
    __tablename__ = 'Users'

    userID = db.Column(db.Integer, nullable=False, primary_key=True, autoincrement=True)
    username = db.Column(db.String(30), nullable=False)
    password = db.Column(db.String(15), nullable=False)
    type = db.Column(db.String(10), nullable=False)
    score = db.Column(db.Integer, nullable=True, default=0)

    # This function should return a printable representation of the User object
    def __repr__(self):
        return '<Users: {}>'.format(self.username)

# This model will be used to represent the tests table in the MySQL database
class tests(db.Model):
    __tablename__ = 'tests'

    testID = db.Column(db.Integer, nullable=False, primary_key=True, autoincrement=True)
    takenDate = db.Column(db.Date, nullable=False, primary_key=True)
    userID = db.Column(db.Integer, db.ForeignKey('Users.userID'), nullable=False, primary_key=True)

    # This function should return a printable representation of the tests object
    def __repr__(self):
        return '<tests: {}>'.format(self.testID)

# This model will be used to represent the questions table in the MySQL database
class questions(db.Model):
    __tablename__ = 'questions'

    questionID = db.Column(db.Integer, nullable=False, primary_key=True, autoincrement=True)
    description = db.Column(db.String(600), nullable=False)

    # This function should return a printable representation of the questions object
    def __repr__(self):
        return '<questions: {}>'.format(self.description)

# This model will be used to represent the q_options table in the MySQL database
class q_options(db.Model):
    __tablename__ = 'q_options'

    optionID = db.Column(db.Integer, nullable=False, primary_key=True, autoincrement=True)
    description = db.Column(db.String(255), nullable=False)
    correct = db.Column(db.SmallInteger, nullable=False) #changed from SMALLINT
    questionID = db.Column(db.Integer, db.ForeignKey('questions.questionID'), nullable=False)

    # This function should return a printable representation of the q_options object
    def __repr__(self):
        return '<q_options: {}>'.format(self.description)

# This model will be used to represent the test_questions table in the MySQL database
class test_questions(db.Model):
    __tablename__ = 'test_questions'

    testID = db.Column(db.Integer, db.ForeignKey('tests.testID'), nullable=False, primary_key=True)
    questionID = db.Column(db.Integer, db.ForeignKey('questions.questionID'), nullable=False, primary_key=True)
    optionID = db.Column(db.Integer, db.ForeignKey('q_options.optionID'), nullable=False, primary_key=True)

    # This function should return a printable representation of the test_questions object
    def __repr__(self):
        return '<test_questions: {}>'.format(self.testID)

# This model will be used to represent the refs table in the MySQL database
class refs(db.Model):
    __tablename__ = 'refs'

    referenceID = db.Column(db.Integer, nullable=False, primary_key=True, autoincrement=True)
    referenceLink = db.Column(db.String(255), nullable=False)
    optionID = db.Column(db.Integer, db.ForeignKey('q_options.optionID'), nullable=False)

    # This function should return a printable representation of the refs object
    def __repr__(self):
        return '<refs: {}>'.format(self.referenceLink)