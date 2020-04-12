# This file contains all application configurations

# Any configurations placed in this class will be common across all environments
class Config(object):
    """
    Common configurations
    """
# Configurations placed in this class are specificially for the development environment
class DevelopmentConfig(Config):
    DEBUG = True # activates debug mode on the application.
    SQLALCHEMY_ECHO = True # assists in debugging by allowing SQLAlchemy to log errors

# Configurations placed in this class are specifically for the production environment
class ProductionConfig(Config):
    DEBUG = False


app_config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig
}