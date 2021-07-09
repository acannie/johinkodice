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
          child: Text("サイコロの目を自動生成！"),
          onTap: () {
            nkoController.initDice();
          },
        ),
        Container(
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: nkoController.dices.length,
            itemBuilder: (BuildContext context, int index) {
              // 初期値
              textFieldControllers
                  .add(TextEditingController(text: nkoController.dices[index]));
              return Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "（例）り",
                      ),
                      controller: textFieldControllers[index],
                      onChanged: (text) {
                        nkoController.dices[index] = text;
                      },
                    ),
                  ),
                  InkWell(
                    child: const Icon(Icons.close),
                    onTap: () {
                      if (nkoController.dices.isNotEmpty) {
                        nkoController.removeDiceAt(index);
                      }
                    },
                  )
                ],
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
