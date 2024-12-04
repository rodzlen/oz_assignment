import pymysql
import pymysql.cursors

connection = pymysql.connect(

    host = 'localhost',
    user = 'root',
    password='1234',
    db= 'airbnb',
    charset='utf8mb4',
    cursorclass= pymysql.cursors.DictCursor
)

with connection.cursor() as cursor:
    # 1
    sql = 'insert into products(productName, price, stockQuantity ) values (%s , %s, %s)'
    cursor.execute(sql, ('Python Book', 10000, 10))
    connection.commit()

    # 2
    cursor.execute("select * from products")
    for book in cursor.fetchall():
        print(book)
    # 3
    sql = "update products set stockquantity = stockQuantity - 1 where productName = '%s'"
    cursor.execute(sql, ('python Book'))
    connection.commit()

    # 4
    sql = "select customername, sum(totalamount)from customers  join orders on customers.customerId = orders.customerId group by customername"
    cursor.execute(sql)

    # 5
    sql = "update customers set email = '%s' where customerId = %s"
    cursor.execute(sql,('asd@gmail.com', 1))
    connection.commit()
    for result in cursor.fetchall():
        print(result)

    # 6
    sql = "delete from orders where orderId =%s"
    cursor.execute(sql, (1))
    connection.commit()
    
    sql = "select * from orders wherer orderId = %s"
    cursor.execute(sql, (1))

    # 7
    sql = "select * from products where productName Like '%s'"
    cursor.execute(sql,('%Book%'))
    datas = cursor.fetchall()
    print(datas['productName'])

    # 8
    sql = "select * from orders where customerId = %s"
    datas = cursor.fetchall()
    cursor.execute(sql, (1))
    for data in datas:
        print(data)

    # 9
    sql = "select c.customername, sum(o.customerId) as total from customers c join orders o on c.customerId = o.customerId group by customername order by total desc limit 1"
    cursor.execute(sql)
    data = cursor.fetchone()
    print(data)

    

cursor.close()