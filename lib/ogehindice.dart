import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

GlobalKey globalKey = GlobalKey();

// キーワードを定義するテキストフィールドのリスト
class PlayJohindice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);
    List<TextEditingController> textFieldControllers = [];

    // グラデーション
    Gradient redGradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 241, 61, 47),
        Color.fromARGB(255, 95, 16, 19),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Gradient goldGradient = const LinearGradient(
      colors: [
        Colors.white,
        Color.fromARGB(255, 236, 236, 186),
        Color.fromARGB(255, 181, 109, 33),
        Color.fromARGB(255, 49, 32, 14),
        Color.fromARGB(255, 181, 109, 33),
        // Color.fromARGB(255, 236, 236, 186),
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Gradient whiteGradient = const LinearGradient(
      colors: [
        Colors.white,
        Colors.white,
        Colors.grey,
        Colors.white,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // 5000兆円のフォント
    Stack premiumText(String text) {
      return Stack(
        children: <Widget>[
          // 影3
          Text(
            text,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 42.5,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 13
                ..color = Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),

          // 影2
          ShaderMask(
            shaderCallback: (bounds) => whiteGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 42,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 13
                  ..color = Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          // 影1
          Text(
            text,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 41,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 13
                ..color = Colors.black,
              fontWeight: FontWeight.w900,
              shadows: const <Shadow>[
                Shadow(
                  color: Colors.black,
                  offset: Offset(-3, 0),
                  blurRadius: 0.0,
                ),
              ],
            ),
          ),

          // 金枠
          ShaderMask(
            shaderCallback: (bounds) => goldGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 12
                  ..color = Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          // 白枠
          ShaderMask(
            shaderCallback: (bounds) => whiteGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4
                  ..color = Colors.white,
                fontWeight: FontWeight.w900,
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.black87,
                    offset: Offset(3.0, 3.0),
                    blurRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),

          // 内側の文字の光
          Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              shadows: <Shadow>[
                Shadow(
                  color: Color.fromARGB(255, 202, 127, 124),
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 0.0,
                ),
              ],
            ),
          ),

          // 内側の文字
          ShaderMask(
            shaderCallback: (bounds) => redGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: <Widget>[
        premiumText("5000兆円  "),
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
        const SizedBox(height: 20),
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
                  const SizedBox(width: 10),
                ],
              ),
          ],
        ),
        const SizedBox(height: 20),
        // 完成した単語
        ListView.builder(
          shrinkWrap: true,
          itemCount: nkoController.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    nkoController.results[index],
                    style: TextStyle(color: Colors.red[800], fontSize: 50),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
