import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// JOUHINKODICE 全体で使用する変数の状態を管理する
class NkoCharController with ChangeNotifier {
  List<String> get keywords => _keywords;
  final List<String> _keywords = [
    "うんこ",
    "うんち",
    "ちんこ",
    "おちんちん",
    "おまんまん",
    "おまんこ",
    "まんこ",
    "ちんちん",
  ];

  void appendNewKeyword() {
    _keywords.add("");
    notifyListeners();
  }

  void removeKeywordAt(int index) {
    _keywords.removeAt(index);
    notifyListeners();
  }

  void clearKeyword() {
    _keywords.clear();
    _keywords.add("");
    notifyListeners();
  }

  List<String> get dices => _dice;
  List<String> _dice = ["う", "お", "こ", "ち", "ま", "ん"];

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

  int get diceNum => _diceNum;
  final int _diceNum = 5;
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

  List<String> get results => _results;
  List<String> _results = [];

  void _judgment(String keyword, List<String> gotDices) {
    // result に含まれる最大数
    int maxCount = (gotDices.length / keyword.length).floor();

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

    // _results.add(keyword);

    // 多いコンボから順に単語成立を調査
    for (int i = 0; i < maxCount; i++) {
      int reversedI = maxCount - i;
      bool establised = true;
      for (int j = 0; j < keyword.length; j++) {
        String c = keyword[j];
        int neccesaryCount = _count(c, keyword) * reversedI;
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
