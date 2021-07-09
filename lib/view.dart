import 'package:flutter/material.dart';

import 'define_keywords.dart';
import 'define_dice.dart';
import 'ogehindice.dart';

// ページ全体のレイアウトを生成
class Johindice extends StatelessWidget {
  Widget appBarMain() {
    return AppBar(
      title: const Text('Ogehindice'),
      backgroundColor: Colors.orange,
      centerTitle: true,
      actions: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: appBarMain(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DefineKeywords(),
                DefineDice(),
                PlayJohindice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
