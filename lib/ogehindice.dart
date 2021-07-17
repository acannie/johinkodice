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
        // Play! ボタン
        SizedBox(
          height: 60,
          width: 120,
          child: ElevatedButton(
            child: const Text(
              "Play!",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[300],
              onPrimary: Colors.black,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              nkoController.generateDice();
            },
          ),
        ),
        Row(
          children: <Widget>[
            // 出た目
            for (int i = 0; i < nkoController.gotDices.length; i++)
              Expanded(
                child: Text(nkoController.gotDices[i]),
              ),
          ],
        ),
        // 完成した単語
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
