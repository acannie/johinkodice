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
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.dices.length,
          itemBuilder: (context, index) {
            textFieldControllers
                .add(TextEditingController(text: nkoController.dices[index]));

            return Row(
              children: [
                Text((index + 1).toString() + "面"),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(
                        suffix: InkWell(
                          child: const Icon(Icons.close, size: 20),
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
                ),
              ],
            );
          },
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
