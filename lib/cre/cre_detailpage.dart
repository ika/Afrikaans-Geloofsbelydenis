import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:geloofsbelydenis/bm/bm_dialog.dart';
import '../bm/bm_model.dart';
import '../bm/bm_queries.dart';
import '../main/db_model.dart';
import '../main/db_queries.dart';

DbQueries _dbQueries = DbQueries();
BmQueries _bmQueries = BmQueries();
int index = 0;

class CreedsDetailPage extends StatefulWidget {
  CreedsDetailPage(int indx, {Key? key}) : super(key: key) {
    index = indx;
  }

  @override
  CreedsDetailPageState createState() => CreedsDetailPageState();
}

class CreedsDetailPageState extends State<CreedsDetailPage> {
  List<Chapter> chapters = List<Chapter>.empty();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
      future: _dbQueries.getChapters('btexts'),
      builder: (context, AsyncSnapshot<List<Chapter>> snapshot) {
        if (snapshot.hasData) {
          chapters = snapshot.data!;
          return showChapters(chapters, index, context);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

showChapters(chapters, index, context) {
  String heading = "Ekumeniese belydenis";

  PageController pageController =
      PageController(initialPage: chapters[index].id);

  final html = Style(
    backgroundColor: Colors.white30,
    padding: HtmlPaddings.all(15.0), //EdgeInsets.all(15.0),
    fontFamily: 'Raleway-Regular',
    fontSize: FontSize(16.0),
  );

  final h2 = Style(
    fontSize: FontSize(18.0),
  );

  final h3 = Style(
    fontSize: FontSize(16.0),
  );

  final i = Style(
    fontSize: FontSize(16.0),
    fontStyle: FontStyle.italic,
    color: Colors.blue,
  );

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
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: const Text('Ekumeniese belydenis'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_outline_sharp,
              color: Colors.yellow,
            ),
            onPressed: () {
              int pg = pageController.page!.toInt();
              int sp = pg + 1;

              var arr = List.filled(2, '');
              arr[0] = "$heading $sp";
              arr[1] = chapters[pg].title;

              BmDialog().showBmDialog(context, arr).then(
                (value) {
                  if (value == ConfirmAction.accept) {
                    final model = BmModel(
                      title: arr[0].toString(),
                      subtitle: note,
                      detail: "2",
                      page: pg.toString(),
                    );
                    _bmQueries.saveBookMark(model);
                  }
                },
              );
            },
          ),
        ],
      );

  return Scaffold(
    appBar: topAppBar(context),
    body: PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      children: [
        SingleChildScrollView(
          child: page0,
        ),
        SingleChildScrollView(
          child: page1,
        ),
        SingleChildScrollView(
          child: page2,
        ),
      ],
    ),
  );
}
