import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// サイコロの数を指定する
class DefineDiceNum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<int>(
          value: nkoController.diceNum,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          elevation: 16,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (int? newValue) {
            nkoController.setDiceNum(newValue!);
          },
          items:
              nkoController.diceNumList.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
        const Text("個"),
      ],
    );
  }
}
