import 'dart:html';

import 'package:flutter/material.dart';

// レイアウトを定義
class JohinkodiceLayout {
  static Widget titleStyle(String text, String imagePath) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: Image(image: AssetImage(imagePath)),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Text(
              text,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.indigo[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget subTitleStyle(String text, String imagePath) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: <Widget>[
            SizedBox(
              height: 30.0,
              child: Image(image: AssetImage(imagePath)),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Text(
              text,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.indigo[200],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget discription(String text) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black87,
        ),
      ),
    );
  }

  static Text attentionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black45,
      ),
    );
  }
}
