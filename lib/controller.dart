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

  void appendToList() {
    _keywords.add("");
    notifyListeners();
  }

  void removeFromList(int index) {
    _keywords.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _keywords.clear();
    _keywords.add("");
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
