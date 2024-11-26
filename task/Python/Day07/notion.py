'''
### [목표]

플레이어는 지도 상에서 보물을 찾아야 합니다. 지도는 그리드로 구성되며, 플레이어는 매 턴마다 이동하여 보물의 위치를 찾아야 합니다. 보물의 위치는 무작위로 설정됩니다.

### [게임 설명]

1. 게임 시작 시, 프로그램은 N x N 크기의 그리드를 생성하고, 그리드 내에 무작위 위치에 보물을 배치합니다.
2. 플레이어는 그리드 내의 특정 위치에서 시작합니다. 초기 위치도 무작위로 결정됩니다.
3. 플레이어는 북(N), 남(S), 동(E), 서(W) 중 하나의 방향으로 한 칸 이동할 수 있습니다.
4. 이동 후, 플레이어는 보물까지의 대략적인 거리를 알 수 있습니다. 정확한 위치는 알 수 없습니다.
5. 플레이어가 보물 위치에 도달하면 게임이 종료되고, 이동 횟수가 공개됩니다.

### [기능 요구 사항]

- **그리드 생성**: N x N 크기의 게임 보드를 생성합니다.
- **보물 및 플레이어 위치 초기화**: 보물과 플레이어의 위치를 무작위로 설정합니다.
- **이동 명령 수행**: 플레이어로부터 이동 명령을 입력받아 수행합니다.
- **거리 힌트 제공**: 플레이어에게 현재 위치에서 보물까지의 거리에 대한 힌트를 제공합니다.
- **게임 종료 조건 확인**: 플레이어가 보물을 찾으면 게임을 종료합니다.

### [개발 단계]

1. **게임 환경 설정**: 필요한 변수(보드 크기, 위치 정보 등)와 게임 보드를 초기화합니다.
2. **플레이어 입력 처리**: 플레이어로부터 이동 명령을 입력받고, 입력에 따라 플레이어의 위치를 업데이트합니다.
3. **거리 계산 및 힌트 제공**: 현재 플레이어 위치에서 보물까지의 거리를 계산하고, 이를 기반으로 힌트를 제공합니다.
4. **게임 종료 및 결과 출력**: 플레이어가 보물 위치에 도달하면 게임을 종료하고, 플레이어의 이동 횟수를 출력합니다.
'''

# 가이드 코드
import random
player_position = [[]]
treasure_position=[[]]

# 게임 초기화
def initialize_game(n):
    #플레이어 및 보물 좌표 생성
    global player_position
    global treasure_position
    player_x , player_y = random.randint(0, n-1), random.randint(0, n-1)
    treasure_x, treasure_y= random.randint(0, n-1), random.randint(0, n-1)

    player_position = (player_x, player_y)
    treasure_position = (treasure_x,treasure_y)
    print("게임판이 생성되었습니다.")

# 거리 계산
def calculate_distance():
    global player_position
    global treasure_position
    player_x, player_y = player_position
    treasure_x, treasure_y = treasure_position
    distance = abs(player_x - treasure_x) + abs(player_y - treasure_y)
    print(f'현재 거리: {distance}칸 남았음')

# 플레이어 이동
def move_player(board_size):
    move = input("어디로 이동할까요? 1. 동, 2. 서, 3. 남, 4. 북\n")
    global player_position
    x , y = player_position
    if move == "동":
        if x+1 <= board_size:
            player_position = (x+1,y)
        else: 
            print("막혔어요 다시 입력하세요")
    if move == "서":
        if x-1 >= 0:
            player_position = (x-1,y)
        else: 
            print("막혔어요 다시 입력하세요")
    if move == "남":
        if y+1 <= board_size:
            player_position = (x, y+1)
        else: 
            print("막혔어요 다시 입력하세요")
    if move == "북":
        if y-1 >= 0:
            player_position = (x, y-1)
        else: 
            print("막혔어요 다시 입력하세요")
# 게임 실행
def play_game(board_size):
    initialize_game(board_size)
    while True:
        #print(player_position, treasure_position) 디버깅용
        if player_position == treasure_position:
            print("축하합니다 보물을 찾았습니다.")
            break
        else:
            calculate_distance()
            move_player(board_size)

# 게임 보드 크기 설정 및 게임 시작
if __name__ == "__main__":
    board_size = 5  # 보드 크기를 5x5로 설정
    play_game(board_size)