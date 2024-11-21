## 붕어빵 진짜 싫다

'''
관리자모드 -> 붕어빵 추가 
            시스템 복귀

판매모드
종료

'''

stock = {
    '팥붕어빵':{"가격":1000,
            "재고":10,
            "총 판매개수":0},
    '슈크림붕어빵':{"가격":1200,
            "재고":8,
            "총 판매개수":0},
    '초코붕어빵':{"가격":1500,
            "재고":5,
            "총 판매개수":0},
}
while True:

    #모드 설정
    id = input("실행할 모드를 선택하세요: 1. 관리, 2. 판매, 3. 종료: ")
    
    #관리자 모드(재고추가)
    if id in["1", "관리"]:
        while True:
            for name, info in stock.items():
                print(f"{name}의 재고: {info['재고']}")
            add_boong=input("추가할 붕어빵을 입력하거나 종료를 입력하세요: ")
            if add_boong == "종료":
                print("재고 추가를 종료합니다.")
                break

            how_boong =int(input("추가할 개수를 입력하세요: "))
            stock[add_boong]["재고"] += how_boong


    # 판매자 모드
    if id in["2", "판매"]:
        while True:
            receipt = {}

            for name, info in stock.items():
                print(f"{name}의 재고: {info['재고']}")
            order = input("주문할 붕어빵 종류 입력하시거나 구매하지 않으시려면 '종료'를 입력해 주세요: ")
            if order == "종료":
                break
            order_q = int(input("주문할 개수 입력: "))


            if stock[order]["재고"] >= order_q:
                stock[order]["재고"] -= order_q
                stock[order]["총 판매개수"] += order_q
                total_price = stock[order]["가격"] * order_q
                receipt={order:order_q}

                print(f'주문내역: {receipt} 총 {total_price}원입니다.')
                print(f"{order} {order_q}개 판매되었습니다")
            
            #주문량이 재고보다 많을 때
            else:
                print("손님 재고가 부족합니다.")
    # 종료
    if id in["3", "종료"]:
        print("사용을 종료합니다.")
        break