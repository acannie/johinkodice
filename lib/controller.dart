import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// JOUHINKODICE 全体で使用する変数の状態を管理する
class NkoCharController with ChangeNotifier {
  // 定数
  // 接頭語
  List<String> prefix = [
    "",
    "ダブル",
    "トリプル",
    "クアドラブル",
    "クインティブル",
    "セクスタプル",
    "セプタプル",
    "オクタプル",
    "ノナプル",
    "ディカプル",
  ];

  // 単語の管理
  List<String> get keywords => _keywords;
  final List<String> _keywords = [
    "イタリア",
    "イギリス",
    "フランス",
  ];

  void appendNewKeyword() {
    _keywords.add("");
    notifyListeners();
  }

  void removeKeywordAt(int index) {
    _keywords.removeAt(index);
    _updateMaxDiceNum();
    notifyListeners();
  }

  void clearKeyword() {
    _keywords.clear();
    _keywords.add("");
    _updateMaxDiceNum();
    notifyListeners();
  }

  void setKeyword(int index, String text) {
    _keywords[index] = text;
    _updateMaxDiceNum();
    notifyListeners();
  }

  // サイコロの目の管理
  List<String> get dices => _dice;
  List<String> _dice = ["イ", "タ", "リ", "ア", "ギ", "ス", "フ", "ラ", "ン"];

  void initDice() {
    Set<String> charSet = {};
    for (String keyword in _keywords) {
      for (int i = 0; i < keyword.length; i++) {
        charSet.add(keyword[i]);
      }
    }
    _dice = charSet.toList();
    notifyListeners();
  }

  void appendNewDice() {
    _dice.add("");
    notifyListeners();
  }

  void removeDiceAt(int index) {
    _dice.removeAt(index);
    notifyListeners();
  }

  void clearDice() {
    _dice.clear();
    _dice.add("");
    notifyListeners();
  }

  // サイコロの数
  int get diceNum => _diceNum;
  int _diceNum = 1;

  int get maxDiceNum => _maxDiceNum;
  int _maxDiceNum = 5;

  List<int> get diceNumList => _diceNumList;
  List<int> _diceNumList = [1, 2, 3, 4, 5];

  void _setDiceList() {
    _diceNumList.clear();
    for (int i = 0; i < _maxDiceNum; i++) {
      _diceNumList.add(i + 1);
    }
  }

  void _updateMaxDiceNum() {
    int minKeywordLength = 100;
    for (String keyword in _keywords) {
      minKeywordLength = min(keyword.length, minKeywordLength);
    }
    _maxDiceNum = minKeywordLength * prefix.length;
    _maxDiceNum = min(100, _maxDiceNum);
    _setDiceList();
  }

  void setDiceNum(int n) {
    _diceNum = n;
    notifyListeners();
  }

  // サイコロを振る処理
  List<String> get gotDices => _gotDice;
  final List<String> _gotDice = [];

  void _deleteEmptyTextField() {
    _dice.remove("");
    _keywords.remove("");
  }

  void generateDice() {
    _deleteEmptyTextField();

    _gotDice.clear();
    _results.clear();

    notifyListeners();

    for (int i = 0; i < _diceNum; i++) {
      Random rand = Random();
      int index = rand.nextInt(_dice.length);
      _gotDice.add(_dice[index]);
    }

    for (String keyword in _keywords) {
      _judgment(keyword, gotDices);
    }

    notifyListeners();
  }

  // 出た目の管理
  List<String> get results => _results;
  List<String> _results = [];

  void _judgment(String keyword, List<String> gotDices) {
    // keyword に含まれる最大数
    int maxCount = (gotDices.length / keyword.length).floor();

    // 多いコンボから順に単語成立を調査
    for (int i = 0; i < maxCount; i++) {
      int reversedI = maxCount - i - 1;
      bool establised = true;
      for (int j = 0; j < keyword.length; j++) {
        String c = keyword[j];
        int neccesaryCount = _count(c, keyword) * (reversedI + 1);
        int existCount = _count(c, gotDices);
        establised &= (existCount >= neccesaryCount);
      }

      if (establised) {
        _results.add("★ " + prefix[reversedI] + keyword + "！");
        return;
      }
    }
  }

  int _count(String c, dynamic s) {
    int count = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == c) {
        count++;
      }
    }
    return count;
  }
}
