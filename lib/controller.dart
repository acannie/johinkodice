import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// FEに画像がアップロードされたことを通知
class NkoCharController with ChangeNotifier {
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
