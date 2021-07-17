import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'define_keywords.dart';
import 'define_dice.dart';
import 'ogehindice.dart';
import 'define_dice_num.dart';
import 'layout.dart';

// ページ全体のレイアウトを生成
class Johindice extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget appBarMain() {
    return AppBar(
      title: const Text('JOHINKODICE'),
      backgroundColor: Colors.blue[200],
      centerTitle: true,
      actions: <Widget>[
        InkWell(
          onTap: () => _launchURL("https://acannie.github.io/acannie"),
          child: const Icon(Icons.face),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
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
                  // Let's Play!
                  JohinkodiceLayout.titleStyle(
                    "Let's Play!",
                    "assets/character_game_dice.png",
                  ),
                  JohinkodiceLayout.discription("サイコロを転がそう！"),
                  PlayJohindice(),
                  // Settings
                  // Keywords
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
                  // Dice
                  JohinkodiceLayout.subTitleStyle(
                    "Dice",
                    "assets/saikoro_145.png",
                  ),
                  JohinkodiceLayout.discription("サイコロの目を決めよう！"),
                  DefineDice(),
                  // Dice Number
                  JohinkodiceLayout.subTitleStyle(
                    "Dice Number",
                    "assets/counter.png",
                  ),
                  JohinkodiceLayout.discription("転がすサイコロの数を決めよう！"),
                  DefineDiceNum(),

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
