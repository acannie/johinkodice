import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'controller.dart';

// サイコロの目を定義するテキストフィールドのリスト
class DefineDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    return Column(
      children: <Widget>[
        InkWell(
          child: const Text("サイコロの目を自動生成！"),
          onTap: () {
            nkoController.initDice();
          },
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nkoController.dices.length,
            itemBuilder: (context, index) {
              textFieldControllers
                  .add(TextEditingController(text: nkoController.dices[index]));

              return SizedBox(
                width: 125,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    decoration: InputDecoration(
                      suffix: InkWell(
                        child: const Icon(Icons.close),
                        onTap: () {
                          if (nkoController.dices.isNotEmpty) {
                            nkoController.removeDiceAt(index);
                          }
                        },
                      ),
                      hintText: "（例）イ",
                    ),
                    controller: textFieldControllers[index],
                    onChanged: (text) {
                      nkoController.dices[index] = text;
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            // 新規作成ボタン
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                nkoController.appendNewDice();
              },
            ),
            // 一括削除ボタン
            IconButton(
              icon: const Icon(Icons.update),
              onPressed: () {
                if (nkoController.dices.isNotEmpty) {
                  nkoController.clearDice();
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
