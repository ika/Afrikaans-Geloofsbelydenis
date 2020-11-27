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

class bDetailPage extends StatelessWidget {
  List<Chapter> chapters = List<Chapter>();
  int index;

  bDetailPage(int index) {
    this.index = index;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
        future: dbProvider.getChapters('btexts'),
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
  String heading = "Ekumeniese belydenis";

  PageController pageController =
      PageController(initialPage: chapters[index].id);

  final html = Style(
      backgroundColor: Colors.white30,
      padding: EdgeInsets.all(15.0),
      fontFamily: 'Raleway-Regular',
      fontSize: FontSize(16.0));

  final h2 = Style(fontSize: FontSize(18.0));
  final h3 = Style(fontSize: FontSize(16.0));
  final i = Style(
      fontSize: FontSize(16.0),
      fontStyle: FontStyle.italic,
      color: Colors.blue);

  final page0 = Html(
    data: chapters[0].text,
    style: {"html": html, "h2": h2, "h3": h3, "i": i},
  );

  final page1 = Html(
    data: chapters[1].text,
    style: {"html": html, "h2": h2, "h3": h3, "i": i},
  );

  final page2 = Html(
    data: chapters[2].text,
    style: {"html": html, "h2": h2, "h3": h3, "i": i},
  );

  topAppBar(context) => AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Ekumeniese belydenis'),
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
                arr[0] = heading + " " + sp.toString();
                arr[1] = chapters[pg].title;

                _showDialog(context, arr).then((value) {
                  if (value == ConfirmAction.ACCEPT) {
                    final model = Model(
                      title: arr[0].toString(),
                      subtitle: note,
                      detail: "2",
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
        ],
      ));
}
