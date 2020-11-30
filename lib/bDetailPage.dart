import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:geloofsbelydenis/bmDialog.dart';
import 'bmModel.dart';
import 'dbModel.dart';
import 'dbHelper.dart';

DBProvider dbProvider = DBProvider();

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

                bmDialog().showBmDialog(context, arr).then((value) {
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
