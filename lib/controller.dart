import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// FEに画像がアップロードされたことを通知
class NkoCharController with ChangeNotifier {
  List<Text> get list => _list;
  final List<Text> _list = [
    // const Text(
    //   "初期値",
    //   style: TextStyle(fontSize: 20),
    // ),
  ];

  void appendToList(Text widget) {
    _list.add(widget);
    notifyListeners();
  }

  void removeFromList(int index) {
    _list.removeAt(index);
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
