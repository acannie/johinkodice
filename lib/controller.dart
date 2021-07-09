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
  List<String> get results => _result;
  final List<String> _result = [];

  void _deleteEmptyTextField() {
    _dice.remove("");
    _keywords.remove("");
  }

  void generateDice() {
    _deleteEmptyTextField();

    for (int i = 0; i < _diceNum; i++) {
      Random rand = Random();
      int index = rand.nextInt(_dice.length);
      _result.add(_dice[index]);
    }
    notifyListeners();
  }

  // Future<MemoryImage> _imageFuture;

  // Future<MemoryImage> get imageFuture => _imageFuture;

  // Future<MemoryImage> pickImage() async {
  //   _imageFuture = ImagePicker().getImage(source: ImageSource.gallery).then(
  //       (file) => file.readAsBytes().then((bytes) => new MemoryImage(bytes)));

  //   // For other components
  //   notifyListeners();
  //   return _imageFuture;
  // }
}
