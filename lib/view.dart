import 'package:flutter/material.dart';

import 'define_keywords.dart';
import 'define_dice.dart';
import 'ogehindice.dart';
import 'define_dice_num.dart';
import 'layout.dart';

// ページ全体のレイアウトを生成
class Johindice extends StatelessWidget {
  Widget appBarMain() {
    return AppBar(
      title: const Text('JOHINKODICE'),
      backgroundColor: Colors.blue[100],
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
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  JohinkodiceLayout.titleStyle(
                    "Let's Play!",
                    "assets/character_game_dice.png",
                  ),
                  JohinkodiceLayout.discription("サイコロを転がそう！"),
                  PlayJohindice(),
                  JohinkodiceLayout.titleStyle(
                    "Settings",
                    "assets/dougu_spanner.png",
                  ),
                  JohinkodiceLayout.subTitleStyle(
                    "Keywords",
                    "assets/bunbougu_memo.png",
                  ),
                  JohinkodiceLayout.discription("サイコロを転がして作りたいキーワードを決めよう！"),
                  DefineKeywords(),
                  JohinkodiceLayout.subTitleStyle(
                    "Dice Number",
                    "assets/counter.png",
                  ),
                  JohinkodiceLayout.discription("転がすサイコロの数を決めよう！"),
                  DefineDiceNum(),
                  JohinkodiceLayout.subTitleStyle(
                    "Dice",
                    "assets/saikoro_145.png",
                  ),
                  JohinkodiceLayout.discription("サイコロの目を決めよう！"),
                  DefineDice(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
