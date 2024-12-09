# Pymongo
from pymongo import MongoClient
from datetime import datetime
client = MongoClient('mongodb://localhost:27017/')
db =client.local
# 1 데이터베이스에 새로운 필드로 genre를 책 데이터에 추가하였습니다. 사용자는 "fantasy" 장르의 모든 책을 찾고 싶어합니다.


def findgenre(genre):
    collection = db.book
    query = {"genre":genre}
    for doc in collection.find(query):
        print(doc)
# findgenre("fantasy")


#2 각 영화 감독별로 그들의 영화 평점의 평균을 계산하고 싶습니다. 이를 통해 어떤 감독이 가장 높은 평균 평점을 가지고 있는지 알아볼 수 있습니다.

def getavg():
    collection = db.movies
    pipline = [
        {"$group":{
            "_id":"$director",
            "average_rate":{"$avg":"$rating"}}},
        {"$sort":{ "average_rate": -1}}]
    results = collection.aggregate(pipline)
    for result in results:
        print(result)
# getavg()

# 3 id가 1인 최근 행동 로그를 조회하려한다. 최신순으로 정렬하여 최근 5개의 행동만을 보기 

def loadlog():
    collection = db.user_actions
    pipeline = [{"$match":{"user_id":1}},{"$sort":{"timestamp":1}},{"$limit":5}]
    results = collection.aggregate(pipeline)
    for result in results:
        print(result)
# loadlog()


# 4 각 출판연도별로 출판된 책의 수를 계산하고자 한다. 결과가 많은 순선대로 정령

def sortyear():
    collection = db.books
    pipeline = [{"$group":{"_id": "$year", "bookcount":{"$sum":1}}},{"$sort":{"bookcount" : -1}}]
    results = collection.aggregate(pipeline)
    for result in results:
        print(result)
# sortyear()

# 5 id 1 인 사용자의 행동을 seen으로 업데이트 
def update_user_action():
    collection = db.user_actions
    filte_query = {"user_id":1,"timestamp":{"$lt":datetime(2023,4,13)}}
    query ={"$set":{"action":"seen"}}
    collection.update_many(filte_query,query)
    results = collection.find()
    for result in results:
        print(result)

update_user_action()