# This file is the application's entry point
import os

from app.__init__ import create_app

# We import the 'create_app' function from 'init.py',
# the value of 'config_name' is taken from the 'FLASK_CONFIG' OS environment variable,
config_name = os.getenv('FLASK_CONFIG')
# Changed from 'app' to 'application' 06/04/2020
application = create_app(config_name)

if __name__ == '__main__':
    application.run()