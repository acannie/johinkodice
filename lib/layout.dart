import 'package:flutter/material.dart';

// レイアウトを定義
class JohinkodiceLayout {
  static Widget titleStyle(String text, String imagePath) {
    return Row(
      children: <Widget>[
        Container(
          height: 30.0,
          child: Image(image: AssetImage(imagePath)),
        ),
        Text(
          text,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  static Text discription(String text) {
    return Text(text);
  }
}
