import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// キーワードを定義するテキストフィールドのリスト
class PlayJohindice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    return Column(
      children: <Widget>[
        InkWell(
          child: Text("サイコロを振る"),
          onTap: () {
            nkoController.generateDice();
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.gotDices.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text(nkoController.gotDices[index]),
                ),
              ],
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text(nkoController.results[index]),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
