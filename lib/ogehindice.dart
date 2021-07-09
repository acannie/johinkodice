import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// キーワードを定義するテキストフィールドのリスト
class Ogehindice extends StatelessWidget {
  final List<String> columnTitles = ["色番号", "色相", "彩度", "明度"];

  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    // return Text("ogehindice");

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
