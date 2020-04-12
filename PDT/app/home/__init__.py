from flask import Blueprint

# home - a blueprint object
home = Blueprint('home', __name__)

from . import views
# from .views import homepage
# from .views import *
# from app.home import views
# from . import views
# import app.home.views