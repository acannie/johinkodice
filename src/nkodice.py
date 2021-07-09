import random
import math


def judgment(word, results):
    # result に含まれる最大数
    max_count = math.floor(len(results) / len(word))

    # 接頭語
    PREFIX = ["", "ダブル", "トリプル", "クアドラブル", "クインティブル",
              "セクスタプル", "セプタプル", "オクタプル", "ノナプル", "ディカプル"]

    # 多いコンボから順に単語成立を調査
    for i in list(reversed(range(max_count))):
        establised = True
        for c in word:
            neccesary_count = (word.count(c))*(i+1)
            exist_count = results.count(c)
            establised &= exist_count >= neccesary_count

        if establised:
            print("★ " + PREFIX[i] + word + "！")
            return

# サイコロの目を定義


def init_chars(KEYWORDS):
    char_set = set()
    for keyword in KEYWORDS:
        for c in keyword:
            char_set.add(c)
    return list(char_set)


def main(KEYWORDS, DICE_NUM):
    # 定数
    CHARS = init_chars(KEYWORDS)

    # サイコロを振る
    results = []
    for i in range(DICE_NUM):
        random_int = random.randint(0, len(CHARS)-1)
        result = CHARS[random_int]
        results.append(result)

    # 出た目を表示
    for result in results:
        print(result + " ", end="")
    print()
    print()

    # 単語成立を判定
    for word in KEYWORDS:
        judgment(word, results)


if __name__ == "__main__":
    KEYWORDS = ["うんこ", "うんち", "まんこ", "おまんこ",
                "おまんまん", "ちんこ", "おちんちん", "ちんちん"]

    # KEYWORDS = ["ふじた", "かずひさ", "かずくん", "ふじたかずひさ", "ふじたかずひさくん", "ふじたさん", "かずひささん", "ふじたかずひささん"
    #             "ささおか", "あかね", "あかねちゃん", "ささおかあかね",  "ささおかあかねちゃん", "ささおかさん", "あかねさん", "ささおかあかねさん"]

    DICE_NUM = 30

    for i in range(100):
        print("-----------")
        main(KEYWORDS, DICE_NUM)
