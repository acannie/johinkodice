import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'controller.dart';
import 'layout.dart';

// サイコロの目を定義するテキストフィールドのリスト
class DefineDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                child: const Icon(Icons.update, color: Colors.white),
                onPressed: () {
                  nkoController.initDice();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[300],
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            const Text(
              "Generate!",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),

        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.dices.length,
          itemBuilder: (context, index) {
            textFieldControllers
                .add(TextEditingController(text: nkoController.dices[index]));

            return Align(
              alignment: Alignment.center,
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("第" + (index + 1).toString() + "面"),
                  const SizedBox(width: 15),
                  Container(
                    height: 30,
                    width: 120,
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
                ],
              ),
            );
          },
        ),
        // リストが空のときに表示
        Visibility(
          visible: nkoController.dices.isEmpty,
          child: JohinkodiceLayout.attentionText("サイコロの目を設定してね！"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 新規作成ボタン
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                nkoController.appendNewDice();
              },
            ),
            // 一括削除ボタン
            Visibility(
              visible: nkoController.dices.isNotEmpty,
              child: IconButton(
                icon: const Icon(Icons.update),
                onPressed: () {
                  if (nkoController.dices.isNotEmpty) {
                    nkoController.clearDice();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
