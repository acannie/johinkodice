import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// キーワードを定義するテキストフィールドのリスト
class DefineKeywords extends StatelessWidget {
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
            return Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "（例）イタリア",
                      suffix: InkWell(
                        child: const Icon(Icons.close, size: 20),
                        onTap: () {
                          if (nkoController.keywords.isNotEmpty) {
                            nkoController.removeKeywordAt(index);
                          }
                        },
                      ),
                    ),
                    controller: textFieldControllers[index],
                    onChanged: (text) {
                      nkoController.keywords[index] = text;
                    },
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
                nkoController.appendNewKeyword();
              },
            ),
            // 一括削除ボタン
            IconButton(
              icon: const Icon(Icons.update),
              onPressed: () {
                if (nkoController.keywords.isNotEmpty) {
                  nkoController.clearKeyword();
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
