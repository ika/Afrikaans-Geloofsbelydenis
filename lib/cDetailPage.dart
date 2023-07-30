import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:geloofsbelydenis/bmDialog.dart';
import 'bmModel.dart';
import 'bmQueries.dart';
import 'dbModel.dart';
import 'dbQueries.dart';

DbQueries _dbQueries = DbQueries();
BmQueries _bmQueries = BmQueries();
int index = 0;

class CDetailPage extends StatefulWidget {
  CDetailPage(int indx, {Key? key}) : super(key: key) {
    index = indx;
  }

  @override
  CDetailPageState createState() => CDetailPageState();
}

class CDetailPageState extends State<CDetailPage> {
  List<Chapter> chapters = List<Chapter>.empty();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
      future: _dbQueries.getChapters('ctexts'),
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
  String heading = "Kategismus";
  String chap = "Sondag";

  PageController pageController =
      PageController(initialPage: chapters[index].id);

  final html = Style(
    backgroundColor: Colors.white30,
    padding: const EdgeInsets.all(15.0),
    fontFamily: 'Raleway-Regular',
    fontSize: const FontSize(16.0),
  );

  final h2 = Style(
    fontSize: const FontSize(18.0),
  );
  final h3 = Style(
    fontSize: const FontSize(16.0),
  );

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
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(heading),
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
              arr[0] = "$heading $chap $sp";
              arr[1] = chapters[pg].title;

              BmDialog().showBmDialog(context, arr).then(
                (value) {
                  if (value == ConfirmAction.accept) {
                    final model = BmModel(
                      title: arr[0].toString(),
                      subtitle: note,
                      detail: "3",
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
        SingleChildScrollView(
          child: page3,
        ),
        SingleChildScrollView(
          child: page4,
        ),
        SingleChildScrollView(
          child: page5,
        ),
        SingleChildScrollView(
          child: page6,
        ),
        SingleChildScrollView(
          child: page7,
        ),
        SingleChildScrollView(
          child: page8,
        ),
        SingleChildScrollView(
          child: page9,
        ),
        SingleChildScrollView(
          child: page10,
        ),
        SingleChildScrollView(
          child: page11,
        ),
        SingleChildScrollView(
          child: page12,
        ),
        SingleChildScrollView(
          child: page13,
        ),
        SingleChildScrollView(
          child: page14,
        ),
        SingleChildScrollView(
          child: page15,
        ),
        SingleChildScrollView(
          child: page16,
        ),
        SingleChildScrollView(
          child: page17,
        ),
        SingleChildScrollView(
          child: page18,
        ),
        SingleChildScrollView(
          child: page19,
        ),
        SingleChildScrollView(
          child: page20,
        ),
        SingleChildScrollView(
          child: page21,
        ),
        SingleChildScrollView(
          child: page22,
        ),
        SingleChildScrollView(
          child: page23,
        ),
        SingleChildScrollView(
          child: page24,
        ),
        SingleChildScrollView(
          child: page25,
        ),
        SingleChildScrollView(
          child: page26,
        ),
        SingleChildScrollView(
          child: page27,
        ),
        SingleChildScrollView(
          child: page28,
        ),
        SingleChildScrollView(
          child: page29,
        ),
        SingleChildScrollView(
          child: page30,
        ),
        SingleChildScrollView(
          child: page31,
        ),
        SingleChildScrollView(
          child: page32,
        ),
        SingleChildScrollView(
          child: page33,
        ),
        SingleChildScrollView(
          child: page34,
        ),
        SingleChildScrollView(
          child: page35,
        ),
        SingleChildScrollView(
          child: page36,
        ),
        SingleChildScrollView(
          child: page37,
        ),
        SingleChildScrollView(
          child: page38,
        ),
        SingleChildScrollView(
          child: page39,
        ),
        SingleChildScrollView(
          child: page40,
        ),
        SingleChildScrollView(
          child: page41,
        ),
        SingleChildScrollView(
          child: page42,
        ),
        SingleChildScrollView(
          child: page43,
        ),
        SingleChildScrollView(
          child: page44,
        ),
        SingleChildScrollView(
          child: page45,
        ),
        SingleChildScrollView(
          child: page46,
        ),
        SingleChildScrollView(
          child: page47,
        ),
        SingleChildScrollView(
          child: page48,
        ),
        SingleChildScrollView(
          child: page49,
        ),
        SingleChildScrollView(
          child: page50,
        ),
        SingleChildScrollView(
          child: page51,
        ),
      ],
    ),
  );
}
