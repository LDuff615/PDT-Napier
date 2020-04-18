# This file will contain the function used to load the correct configurations from config.py and instance/config.py
# Third-party module imports
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

# local module imports
from config import app_config

# database variable initialisation
db = SQLAlchemy()
# db - will be used to interact with the database

# This function will load the correct configuration from config.py,
# depending on the configuration name passed as a parameter
# This function will also load the correct configurations from instance/config.py
def create_app(config_name):
    # Changed from 'app' to 'application' 06/04/2020
    application = Flask(__name__, instance_relative_config=True)

    application.config.from_object(app_config[config_name])

    application.config.from_pyfile('config.py')

    db.init_app(application)
    # Migrations allow us to manage changes we make to models
    migrate = Migrate(application, db)
    # migrate - an object that allows us to run migrations using Flask-Migrate

    from app import models

    # imported and registered the home blueprint
    from .home.__init__ import home as home_blueprint
    application.register_blueprint(home_blueprint)

    return application
