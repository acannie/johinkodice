import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// キーワードを定義するテキストフィールドのリスト
class DefineKeywords extends StatelessWidget {
  final List<String> columnTitles = ["色番号", "色相", "彩度", "明度"];

  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.keywords.length,
          itemBuilder: (BuildContext context, int index) {
            // 初期値
            textFieldControllers.add(
                TextEditingController(text: nkoController.keywords[index]));
            return Row(children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "（例）りんご",
                  ),
                  controller: textFieldControllers[index],
                  onChanged: (text) {
                    nkoController.keywords[index] = text;
                  },
                ),
              ),
              InkWell(
                child: const Icon(Icons.close),
                onTap: () {
                  if (nkoController.keywords.isNotEmpty) {
                    nkoController.removeFromList(index);
                  }
                },
              )
            ]);
          },
        ),
        Row(
          children: [
            // 新規作成ボタン
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                nkoController.appendToList();
              },
            ),
            // 一括削除ボタン
            IconButton(
              icon: const Icon(Icons.update),
              onPressed: () {
                if (nkoController.keywords.isNotEmpty) {
                  nkoController.clear();
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
