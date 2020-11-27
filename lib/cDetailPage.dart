import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'bmModel.dart';
import 'dbModel.dart';
import 'dbHelper.dart';

enum ConfirmAction { CANCEL, ACCEPT }

DBProvider dbProvider = DBProvider();
String note = "";

class cDetailPage extends StatelessWidget {
  List<Chapter> chapters;
  int index;

  cDetailPage(int index) {
    this.index = index;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
        future: dbProvider.getChapters('ctexts'),
        builder: (context, AsyncSnapshot<List<Chapter>> snapshot) {
          if (snapshot.hasData) {
            chapters = snapshot.data;
            return showChapters(chapters, index, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

Future _showDialog(context, arr) async {

  String txt = arr[1].toString();

  if(txt.length > 40) {
    txt.substring(1,40);
  }

  TextEditingController _controller = new TextEditingController();
  note = _controller.text = txt;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Boekmerk?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(arr[0].toString(), style: TextStyle(fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    autofocus: true,
                    maxLength: 50,
                    controller: _controller,
                    decoration: new InputDecoration(
                        labelText: 'Tik teks in',
                        labelStyle: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    onChanged: (value) {
                      note = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Ja', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          ),
          TextButton(
            child: Text('Nee', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
        ],
      );
    },
  );
}

showChapters(chapters, index, context) {
  String heading = "Kategismus";
  String chap = "Sondag";

  PageController pageController =
      PageController(initialPage: chapters[index].id);

  final html = Style(
      backgroundColor: Colors.white30,
      padding: EdgeInsets.all(15.0),
      fontFamily: 'Raleway-Regular',
      fontSize: FontSize(16.0));

  final h2 = Style(fontSize: FontSize(18.0));
  final h3 = Style(fontSize: FontSize(16.0));

  final page0 = Html(
    data: chapters[0].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page1 = Html(
    data: chapters[1].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page2 = Html(
    data: chapters[2].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page3 = Html(
    data: chapters[3].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page4 = Html(
    data: chapters[4].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page5 = Html(
    data: chapters[5].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page6 = Html(
    data: chapters[6].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page7 = Html(
    data: chapters[7].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page8 = Html(
    data: chapters[8].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page9 = Html(
    data: chapters[9].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page10 = Html(
    data: chapters[10].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page11 = Html(
    data: chapters[11].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page12 = Html(
    data: chapters[12].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page13 = Html(
    data: chapters[13].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page14 = Html(
    data: chapters[14].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page15 = Html(
    data: chapters[15].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page16 = Html(
    data: chapters[16].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page17 = Html(
    data: chapters[17].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page18 = Html(
    data: chapters[18].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page19 = Html(
    data: chapters[19].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page20 = Html(
    data: chapters[20].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page21 = Html(
    data: chapters[21].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page22 = Html(
    data: chapters[22].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page23 = Html(
    data: chapters[23].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page24 = Html(
    data: chapters[24].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page25 = Html(
    data: chapters[25].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page26 = Html(
    data: chapters[26].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page27 = Html(
    data: chapters[27].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page28 = Html(
    data: chapters[28].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page29 = Html(
    data: chapters[29].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page30 = Html(
    data: chapters[30].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page31 = Html(
    data: chapters[31].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page32 = Html(
    data: chapters[32].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page33 = Html(
    data: chapters[33].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page34 = Html(
    data: chapters[34].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page35 = Html(
    data: chapters[35].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page36 = Html(
    data: chapters[36].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page37 = Html(
    data: chapters[37].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page38 = Html(
    data: chapters[38].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page39 = Html(
    data: chapters[39].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page40 = Html(
    data: chapters[40].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page41 = Html(
    data: chapters[41].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page42 = Html(
    data: chapters[42].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page43 = Html(
    data: chapters[43].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page44 = Html(
    data: chapters[44].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page45 = Html(
    data: chapters[45].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page46 = Html(
    data: chapters[46].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page47 = Html(
    data: chapters[47].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page48 = Html(
    data: chapters[48].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page49 = Html(
    data: chapters[49].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page50 = Html(
    data: chapters[50].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  final page51 = Html(
    data: chapters[51].text,
    style: {"html": html, "h2": h2, "h3": h3},
  );

  topAppBar(context) => AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(heading),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.bookmark_outline_sharp,
                color: Colors.yellow,
              ),
              onPressed: () {
                int pg = pageController.page.toInt();
                int sp = pg + 1;

                var arr = new List(2);
                arr[0] = heading + " " + chap + " " + sp.toString();
                arr[1] = chapters[pg].title;

                _showDialog(context, arr).then((value) {
                  if (value == ConfirmAction.ACCEPT) {
                    final model = Model(
                      title: arr[0].toString(),
                      subtitle: note,
                      detail: "3",
                      page: pg.toString(),
                    );
                    dbProvider.saveBookMark(model);
                  }
                });
              }),
        ],
      );

  return Scaffold(
      appBar: topAppBar(context),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: [
          Container(
              child: SingleChildScrollView(
            child: page0,
          )),
          Container(
              child: SingleChildScrollView(
            child: page1,
          )),
          Container(
              child: SingleChildScrollView(
            child: page2,
          )),
          Container(
              child: SingleChildScrollView(
            child: page3,
          )),
          Container(
              child: SingleChildScrollView(
            child: page4,
          )),
          Container(
              child: SingleChildScrollView(
            child: page5,
          )),
          Container(
              child: SingleChildScrollView(
            child: page6,
          )),
          Container(
              child: SingleChildScrollView(
            child: page7,
          )),
          Container(
              child: SingleChildScrollView(
            child: page8,
          )),
          Container(
              child: SingleChildScrollView(
            child: page9,
          )),
          Container(
              child: SingleChildScrollView(
            child: page10,
          )),
          Container(
              child: SingleChildScrollView(
            child: page11,
          )),
          Container(
              child: SingleChildScrollView(
            child: page12,
          )),
          Container(
              child: SingleChildScrollView(
            child: page13,
          )),
          Container(
              child: SingleChildScrollView(
            child: page14,
          )),
          Container(
              child: SingleChildScrollView(
            child: page15,
          )),
          Container(
              child: SingleChildScrollView(
            child: page16,
          )),
          Container(
              child: SingleChildScrollView(
            child: page17,
          )),
          Container(
              child: SingleChildScrollView(
            child: page18,
          )),
          Container(
              child: SingleChildScrollView(
            child: page19,
          )),
          Container(
              child: SingleChildScrollView(
            child: page20,
          )),
          Container(
              child: SingleChildScrollView(
            child: page21,
          )),
          Container(
              child: SingleChildScrollView(
            child: page22,
          )),
          Container(
              child: SingleChildScrollView(
            child: page23,
          )),
          Container(
              child: SingleChildScrollView(
            child: page24,
          )),
          Container(
              child: SingleChildScrollView(
            child: page25,
          )),
          Container(
              child: SingleChildScrollView(
            child: page26,
          )),
          Container(
              child: SingleChildScrollView(
            child: page27,
          )),
          Container(
              child: SingleChildScrollView(
            child: page28,
          )),
          Container(
              child: SingleChildScrollView(
            child: page29,
          )),
          Container(
              child: SingleChildScrollView(
            child: page30,
          )),
          Container(
              child: SingleChildScrollView(
            child: page31,
          )),
          Container(
              child: SingleChildScrollView(
            child: page32,
          )),
          Container(
              child: SingleChildScrollView(
            child: page33,
          )),
          Container(
              child: SingleChildScrollView(
            child: page34,
          )),
          Container(
              child: SingleChildScrollView(
            child: page35,
          )),
          Container(
              child: SingleChildScrollView(
            child: page36,
          )),
          Container(
              child: SingleChildScrollView(
            child: page37,
          )),
          Container(
              child: SingleChildScrollView(
            child: page38,
          )),
          Container(
              child: SingleChildScrollView(
            child: page39,
          )),
          Container(
              child: SingleChildScrollView(
            child: page40,
          )),
          Container(
              child: SingleChildScrollView(
            child: page41,
          )),
          Container(
              child: SingleChildScrollView(
            child: page42,
          )),
          Container(
              child: SingleChildScrollView(
            child: page43,
          )),
          Container(
              child: SingleChildScrollView(
            child: page44,
          )),
          Container(
              child: SingleChildScrollView(
            child: page45,
          )),
          Container(
              child: SingleChildScrollView(
            child: page46,
          )),
          Container(
              child: SingleChildScrollView(
            child: page47,
          )),
          Container(
              child: SingleChildScrollView(
            child: page48,
          )),
          Container(
              child: SingleChildScrollView(
            child: page49,
          )),
          Container(
              child: SingleChildScrollView(
            child: page50,
          )),
          Container(
              child: SingleChildScrollView(
            child: page51,
          )),
        ],
      ));
}
