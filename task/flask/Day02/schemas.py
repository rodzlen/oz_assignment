from marshmallow import Schema, fields

class BookSchema(Schema):
    
    id =fields.Int(dump_only=True) # dump_only는 서버에서 직접 데이터를 관리
    title =fields.String(required=True)
    author =fields.String(required=True)