import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'bmModel.dart';
import 'dbModel.dart';
import 'dbHelper.dart';
import 'bmDialog.dart';

DBProvider dbProvider = DBProvider();

class dDetailPage extends StatelessWidget {
  List<Chapter> chapters;
  int index;

  dDetailPage(int index) {
    this.index = index;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
        future: dbProvider.getChapters('dtexts'),
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

showChapters(chapters, index, context) {
  String heading = "Leerreëls";
  String chap = "Gedeelte";

  PageController pageController =
      PageController(initialPage: chapters[index].id);

  final html = Style(
      backgroundColor: Colors.white30,
      padding: EdgeInsets.all(15.0),
      fontFamily: 'Raleway-Regular',
      fontSize: FontSize(16.0));

  final h2 = Style(fontSize: FontSize(16.0));
  final h3 = Style(fontSize: FontSize(18.0));

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

                bmDialog().showBmDialog(context, arr).then((value) {
                  if (value == ConfirmAction.ACCEPT) {
                    final model = Model(
                      title: arr[0].toString(),
                      subtitle: note,
                      detail: "4",
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
        ],
      ));
}
