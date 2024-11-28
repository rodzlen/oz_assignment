import random

# 게임에 사용될 단어 목록
words = ["apple", "banana", "orange", "grape", "lemon"]

# 행맨 그림
hangman_pics = [
    """
     ------
     |    |
     |
     |
     |
     |
    ---""",
    """
     ------
     |    |
     |    O
     |
     |
     |
    ---""",
    """
     ------
     |    |
     |    O
     |    |
     |
     |
    ---""",
    """
     ------
     |    |
     |    O
     |   /|
     |
     |
    ---""",
    """
     ------
     |    |
     |    O
     |   /|\\
     |
     |
    ---""",
    """
     ------
     |    |
     |    O
     |   /|\\
     |   /
     |
    ---""",
    """
     ------
     |    |
     |    O
     |   /|\\
     |   / \\
     |
    ---""",
]


class HangmanGame:
    def __init__(self):
        self.count = 6
        self.word = random.choice(words)  # 랜덤 단어 선택
        self.quiz = list("_" * len(self.word))  # 밑줄 리스트로 초기화

    def display(self):
        print(hangman_pics[ self.count])  # 남은 목숨에 따라 행맨 그림 출력
        print("단어: " + " ".join(self.quiz))  # 현재 상태 출력

    def engine(self):
        answer = input("맞출 글자를 입력하세요: ").lower()
        if len(answer) != 1 or not answer.isalpha():
            print("한 글자만 입력하세요.")
            return

        if answer in self.word:
            for idx, char in enumerate(self.word):
                if char == answer:
                    self.quiz[idx] = answer
            print("맞췄습니다!")
        else:
            self.count -= 1
            print("틀렸습니다! 목숨이 줄어듭니다.")

    def play(self):
        while True:
            print("행맨 게임 프로세스 시작")
            switch = input("시작 | 종료: ").strip().lower()
            if switch == "시작":
                self.count = 6
                self.word = random.choice(words)  # 랜덤 단어 선택
                self.quiz = list("_" * len(self.word))  # 초기화
                print(f"힌트: 단어는 {len(self.word)}글자입니다.")  # 힌트 추가

                while self.count > 0:
                    self.display()
                    if "".join(self.quiz) == self.word:
                        print("축하합니다! 단어를 맞추셨습니다: " + self.word)
                        break
                    self.engine()

                if self.count == 0:
                    print(hangman_pics[0])
                    print("아쉽습니다. 정답은: " + self.word)
            elif switch == "종료":
                print("행맨 게임을 종료합니다.")
                break
            else:
                print("유효하지 않은 입력입니다. 다시 시도해주세요.")


if __name__ == "__main__":
    game = HangmanGame()
    game.play()
