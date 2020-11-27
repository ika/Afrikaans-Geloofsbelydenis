import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geloofsbelydenis/bMain.dart';
import 'cMain.dart';
import 'dMain.dart';
import 'dbModel.dart';
import 'dbHelper.dart';
import 'package:flutter/cupertino.dart';
import 'aDetailPage.dart';
import 'bDetailPage.dart';
import 'package:share/share.dart';

import 'eMain.dart';

class aMain extends StatelessWidget {
  DBProvider dbProvider = DBProvider();
  List<Chapter> chapters = List<Chapter>();

  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
        future: dbProvider.getTitleList('atexts'),
        builder: (context, AsyncSnapshot<List<Chapter>> snapshot) {
          if (snapshot.hasData) {
            chapters = snapshot.data;
            return showChapterList(chapters, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  showChapterList(chapters, context) {
    ListTile makeListTile(chapters, int index) =>
        ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            // leading: Container(
            //   padding: EdgeInsets.only(right: 12.0),
            //   decoration: new BoxDecoration(
            //       border: new Border(
            //           right: new BorderSide(width: 1.0, color: Colors.white24))),
            //   child: Icon(Icons.autorenew, color: Colors.white),
            // ),
            title: Text(
              chapters[index].chap,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
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
                        text: " " + chapters[index].title),
                  ),
                ),
              ],
            ),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.push(context,
                    CupertinoPageRoute(
                        builder: (context) => aDetailPage(index)));
              });
            });

    Card makeCard(chapters, int index) =>
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(chapters, index),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: chapters == null ? 0 : chapters.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(chapters, index);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text('Geloofsbelydenis'),
      // actions: <Widget>[
      //  IconButton(
      //    icon: Icon(Icons.list_sharp),
      //    onPressed: () {},
      //  )
      // ],
    );

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0))),
          context: context,
          builder: (BuildContext bc) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.book_online_outlined,
                        color: Colors.blueGrey,
                      ),
                      title: new Text('Ekumeniese belydenise'),
                      onTap: () =>
                      {
                        Navigator.pop(context),
                        Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => bMain()));
                            }),
                      }),
                  new ListTile(
                      leading:
                      new Icon(Icons.book_rounded, color: Colors.blueGrey),
                      title: new Text('Heidelbergse Kategismus'),
                      onTap: () =>
                      {
                        Navigator.pop(context),
                        Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => cMain()));
                            }),
                      }),
                  new ListTile(
                      leading:
                      new Icon(Icons.book_online, color: Colors.blueGrey),
                      title: new Text('Dordtse Leerreëls'),
                      onTap: () =>
                      {
                        Navigator.pop(context),
                        Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => dMain()));
                            }),
                      }),
                  new ListTile(
                      leading:
                      new Icon(Icons.bookmarks, color: Colors.blueGrey),
                      title: new Text('Boekmerke'),
                      onTap: () =>
                      {
                        Navigator.pop(context),
                        Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => eMain()));
                            }),
                      }),
                  new ListTile(
                      leading: new Icon(Icons.share, color: Colors.blueGrey),
                      title: new Text('Deel hierdie Geloofsbelydenis'),
                      onTap: () => {
                      Navigator.pop(context),
                      Share.share(
                      'Geloofsbelydenis https://play.google.com/store/apps/details?id=org.armstrong.ika.geloofsbelydenis')
                  }),
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
