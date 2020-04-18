# This file will be used to create and initialize the 'home' blueprint
from flask import Blueprint

# home - a blueprint object
home = Blueprint('home', __name__)

from . import views