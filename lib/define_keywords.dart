import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

// マイデザインのパレットを生成
class DefineKeywords extends StatelessWidget {
  final List<String> columnTitles = ["色番号", "色相", "彩度", "明度"];

  @override
  Widget build(BuildContext context) {
    final NkoCharController nkoController =
        Provider.of<NkoCharController>(context);

    return Column(
      children: <Widget>[
        // ListView(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.all(20.0),
        //   children: const <Widget>[
        //     Text("I'm dedicating every day to you"),
        //     Text('Domestic life was never quite my style'),
        //     Text('When you smile, you knock me out, I fall apart'),
        //     Text('And I thought I was so smart'),
        //   ],
        // ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: nkoController.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(children: <Widget>[
                nkoController.list[index],
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    if (nkoController.list.length == 1) {
                      Text("これ以上減らせません。");
                    } else {
                      nkoController.removeFromList(index);
                    }
                  },
                )
              ]);
            },
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                nkoController.appendToList(
                  Text(
                    "テキスト" + nkoController.list.length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (nkoController.list.length == 1) {
                  Text("これ以上減らせません。");
                } else {
                  nkoController.removeFromList(nkoController.list.length - 1);
                }
              },
            ),
          ],
        )
      ],
    );

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('top text'),
      Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return index % 2 == 0 ? Text('item no:$index') : Divider();
              })),
      Text('end text')
    ]);

    // return FutureBuilder<MyDesignData>(
    //   future: upload_controller.myDesignDataFuture,
    //   builder: (BuildContext context, AsyncSnapshot<MyDesignData> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.connectionState == ConnectionState.done &&
    //         null != snapshot.data) {
    //       var myDesignData = snapshot.data;
    //       return ConstrainedBox(
    //         constraints: BoxConstraints(maxWidth: 300),
    //         child: Table(
    //           children: <TableRow>[
    //             TableRow(
    //               children: columnTitles
    //                   .map(
    //                     (columnTitle) => TableCell(
    //                       // flex: 1,
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                           border: Border.all(color: Colors.black),
    //                           color: Colors.white,
    //                         ),
    //                         // width: screenSize.width * 0.1,
    //                         // height: screenSize.height * 0.025,
    //                         child: AutoSizeText(
    //                           columnTitle.toString(),
    //                           maxLines: 1,
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             color: Colors.black,
    //                           ),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                   .toList(),
    //             ),
    //             // information of each color
    //             for (var i = 0; i < myDesignData.myDesignPalette.length; i++)
    //               TableRow(
    //                 children: [
    //                   TableCell(
    //                     // flex: 1,
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: Colors.black),
    //                         color: Color.fromRGBO(
    //                           myDesignData.palette[i][0],
    //                           myDesignData.palette[i][1],
    //                           myDesignData.palette[i][2],
    //                           1,
    //                         ),
    //                       ),
    //                       // width: screenSize.width * 0.1,
    //                       // height: screenSize.height * 0.025,
    //                       child: AutoSizeText(
    //                         "${i + 1}",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                           fontSize: 20,
    //                           color: Utils().fontColor(
    //                             Color.fromRGBO(
    //                               myDesignData.palette[i][0],
    //                               myDesignData.palette[i][1],
    //                               myDesignData.palette[i][2],
    //                               1,
    //                             ),
    //                           ),
    //                         ),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                     ),
    //                   ),
    //                   for (var factor = 0;
    //                       factor < myDesignData.myDesignPalette[i].length;
    //                       factor++)
    //                     TableCell(
    //                       // flex: 1,
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                           border: Border.all(color: Colors.black),
    //                           color: Colors.white,
    //                         ),
    //                         child: AutoSizeText(
    //                           "${myDesignData.myDesignPalette[i][factor]}",
    //                           maxLines: 1,
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             color: Colors.black,
    //                           ),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ),
    //                     ),
    //                 ],
    //               )
    //           ],
    //         ),
    //       );
    //     } else if (null != snapshot.error) {
    //       return Container(
    //         child: Text(
    //           'No Image Selected',
    //           textAlign: TextAlign.center,
    //         ),
    //         height: 100,
    //         width: 100,
    //         decoration: BoxDecoration(
    //           border: Border.all(color: Colors.blue),
    //         ),
    //       );
    //     } else {
    //       return SizedBox.shrink();
    //     }
    //   },
    // );
  }
}
