from flask import Flask
from flask_smorest import Api
from api import book_blp

app = Flask(__name__)

app.config['APT_TITLE'] = 'Book API'
app.config['API VERSION'] = 'v1'
app.config['OPENAPI_VERSION'] = '3.0.2'
app.config['OPENAPI_URL_PREFIX'] = "/"
app.config['OPENAPI_SWAGGER_UI_PATH'] = "/swagger-ui-doc"
app.config['OPENAPI_SWAGGER_UI_URL'] = "https://cdn.jsdelivr.net/npm/npm.swagger-ui-dist"

api = Api(app)
api.register_blueprint(book_blp)

if __name__ == '__main__':
    app.run(debug=True)