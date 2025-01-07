from flask import Flask, render_template
from flask_smorest import Api
from flask_mysqldb import MySQL
import yaml
from posts_routes import create_posts_blueprint

app = Flask(__name__)

# openApi 연동
app.config["API_TITLE"] = "My API"
app.config["API_VERSION"] = "v1"
app.config["OPENAPI_VERSION"] = "3.1.3"
app.config["OPENAPI_URL_PREFIX"] = "/"
app.config["OPENAPI_SWAGGER_UI_PATH"] = "/swagger-ui"
app.config["OPENAPI_SWAGGER_UI_URL"] = "https://cdn.jsdelivr.net/npm/swagger-ui-dist/"

api = Api(app)


# DB 연동
db = yaml.load(open('db.yaml'), Loader=yaml.FullLoader)

app.config["MYSQL_HOST"] = db["host"]
app.config["MYSQL_PORT"] = db["port"]
app.config["MYSQL_USER"] = db["user"]
app.config["MYSQL_PASSWORD"] = db["pw"]
app.config["MYSQL_DB"] = db["db"]

mysql = MySQL(app)

# Blueprint 등록
posts_blp = create_posts_blueprint(mysql)
api.register_blueprint(posts_blp)

# template 렌더링 
@app.route('/manage-posts')
def manage_posts():
    return render_template('posts.html')

if __name__ == "__main__": 
    app.run(debug=True)