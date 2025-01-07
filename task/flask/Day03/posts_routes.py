from flask import request, jsonify
from flask_smorest import Blueprint, abort

def create_posts_blueprint(mysql):
    posts_blp = Blueprint(
        "posts",
        __name__,
        description="posts api",
        url_prefix="/posts",
    )

    @posts_blp.route('/', methods=['GET','POST'])
    def posts():
        cursor = mysql.connection.cursor()
        # 조회 요청
        if request.method == 'GET':
            sql = "select * from posts"
            cursor.execute(sql)
            posts = cursor.fetchall()

            # 디버깅
            #print(posts)
            
            return jsonify([{"id":post[0],"title":post[1],"content":post[2]}for post in posts]), 201
        
        # 생성 요청
        elif request.method == "POST":
            title = request.json.get("title")
            content = request.json.get("content")

            if not title or not content:
                abort(400, message="title 또는 content가 없습니다.")

            sql = "INSERT INTO posts(title, content) VALUES(%s, %s)"
            cursor.execute(sql, (title, content))
            mysql.connection.commit()
            
            return jsonify({"message": "success"}), 201
        
    # 세부내용 조회 및 수정, 삭제 요청
    @posts_blp.route('/<int:post_id>', methods=['GET','PUT','DELETE'])
    def post(post_id):
        # db연결
        cursor = mysql.connection.cursor()

        # 세부사항 조회
        if request.method == "GET":
            sql = f"SELECT * FROM posts WHERE id={post_id}"
            cursor.execute(sql)
            post = cursor.fetchone()

            if not post:
                abort(404, message="해당 게시글이 없습니다.")
            return {
                "id": post[0],
                "title": post[1],
                "content": post[2],
            }
        
        # 수정 요청
        if request.method == 'PUT':
            title = request.json.get('title')
            content = request.json.get('content')
            sql = f"update posts set title='{title}',content='{content}' where id ={post_id}"
            cursor.execute(sql)
            mysql.connection.commit()
            
            return {'msg':'successfully post data updated'}, 200
        
        # 삭제 요청
        if request.method == "DELETE":
            sql = f"select * from posts where id={post_id}"
            cursor.execute(sql)
            isexist = cursor.fetchone()
            if not isexist:
                return {"msg":"해당 데이터가 존재하지 않아요"},404
            
            sql = f"delete from posts where id ={post_id}"
            cursor.execute(sql)
            mysql.connection.commit()
            
            return {"msg":"successfully deleted data"},200

    return posts_blp