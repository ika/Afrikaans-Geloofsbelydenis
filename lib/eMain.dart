import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geloofsbelydenis/bmModel.dart';
import 'aDetailPage.dart';
import 'bDetailPage.dart';
import 'cDetailPage.dart';
import 'dDetailPage.dart';
import 'dbHelper.dart';
import 'package:flutter/cupertino.dart';

// bookmarks

enum ConfirmAction { CANCEL, ACCEPT }

DBProvider dbProvider = DBProvider();

Future _showDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Vee boekmerk uit?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Is jy seker jy wil hierdie boekmerk uitvee?'),
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

class eMain extends StatefulWidget {
  @override
  _eMainState createState() => _eMainState();
}

class _eMainState extends State<eMain> {
  List<Model> list = List<Model>();
  Model model;

  Widget build(BuildContext context) {
    return FutureBuilder<List<Model>>(
        future: dbProvider.getBookMarkList(),
        builder: (context, AsyncSnapshot<List<Model>> snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data;
            return showChapterList(list, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  showChapterList(list, context) {
    ListTile makeListTile(list, int index) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            list[index].title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: TextStyle(color: Colors.white),
                      text: " " + list[index].subtitle),
                ),
              ),
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            int goto = int.parse(list[index].page);
            Future.delayed(const Duration(milliseconds: 200), () {
              switch (list[index].detail) {
                case "1":
                  {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => aDetailPage(goto)));
                  }
                  break;

                case "2":
                  {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => bDetailPage(goto)));
                  }
                  break;

                case "3":
                  {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => cDetailPage(goto)));
                  }
                  break;

                case "4":
                  {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => dDetailPage(goto)));
                  }
                  break;
              }
            });
          },
          onLongPress: () {
            _showDialog(context).then((value) {
              if (value == ConfirmAction.ACCEPT) {
                dbProvider.deleteBookMark(list[index].id).then((value) {
                  setState(() {
                    list.removeAt(index);
                  });
                });
              }
            });
          },
        );

    Card makeCard(list, int index) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(list, index),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(list, index);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text('Boekmerke'),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}
