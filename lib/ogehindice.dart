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
        // 出た目
        Wrap(
          children: <Widget>[
            for (int i = 0; i < nkoController.gotDices.length; i++)
              Wrap(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      nkoController.gotDices[i],
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
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
