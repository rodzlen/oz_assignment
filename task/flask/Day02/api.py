from flask_smorest import Blueprint, abort
from flask.views import MethodView
from schemas import BookSchema

# books의 블루프린트 인스턴스
book_blp = Blueprint('books','books', url_prefix='/books', description='Operation on books')

# db 대신 사용
books =[]

@book_blp.route('/')
class BookList(MethodView):
    @book_blp.response(200, BookSchema(many=True))
    def get(self):
        return books
    
    @book_blp.arguments(BookSchema)
    @book_blp.response(201,BookSchema)
    def post(self, new_data):
        new_data['id'] = len(books)+1 # id를 서버에서 직접 생성 (품목 삭제후 아이디가 겹칠 수 있으나 편의상 그냥 사용;)
        books.append(new_data)
        return new_data
    
@book_blp.route('/<int:book_id>')
class Book(MethodView):
    @book_blp.response(200, BookSchema)
    def get(self, book_id):
        book = next((book for book in books if book['id']== book_id), None)
        if book is None:
            abort(404, message="Book not found")
        return book
    
    @book_blp.arguments(BookSchema)
    @book_blp.response(201, BookSchema)
    def put(self, new_data, book_id):
        book = next((book for book in books if book['id']== book_id), None)
        if book is None:
            abort(404, message="Book not found")
        book.update(new_data)
        return book

    @book_blp.response(204)
    def delete(self, book_id):
        # 삭제할 항목 전역으로 설정
        global books
        book = next((book for book in books if book['id']== book_id), None)
        if book is None:
            abort(404, message="Book not found")
        books = [book for book in books if book['id']!=book_id]
        return ''

