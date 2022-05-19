import 'package:flutter/material.dart';
import 'package:geloofsbelydenis/bMain.dart';
import 'cMain.dart';
import 'dMain.dart';
import 'dbModel.dart';
import 'package:flutter/cupertino.dart';
import 'aDetailPage.dart';
import 'package:share/share.dart';
import 'dbQueries.dart';
import 'eMain.dart';

DbQueries _dbQueries = DbQueries();

class AMain extends StatefulWidget {
  const AMain({Key key}) : super(key: key);

  @override
  _AMainState createState() => _AMainState();
}

class _AMainState extends State<AMain> {
  List<Chapter> chapters = List<Chapter>.empty();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
      future: _dbQueries.getTitleList('atexts'),
      builder: (context, AsyncSnapshot<List<Chapter>> snapshot) {
        if (snapshot.hasData) {
          chapters = snapshot.data;
          return showChapterList(chapters, context);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  _onShareLink(BuildContext context) async {
    await Share.share(
        'Geloofsbelydenis https://play.google.com/store/apps/details?id=org.armstrong.ika.geloofsbelydenis');
  }

  showChapterList(chapters, context) {
    ListTile makeListTile(chapters, int index) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            chapters[index].chap,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              const Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: const StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: const TextStyle(color: Colors.white),
                      text: " " + chapters[index].title),
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
          onTap: () {
            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ADetailPage(index),
                  ),
                );
              },
            );
          },
        );

    Card makeCard(chapters, int index) => Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(chapters, index),
          ),
        );

    // final makeBody = ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: chapters == null ? 0 : chapters.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return makeCard(chapters, index);
    //   },
    // );

    // final topAppBar = AppBar(
    //   elevation: 0.1,
    //   backgroundColor: const Color.fromRGBO(64, 75, 96, .9),
    //   title: const Text('Geloofsbelydenis'),
    // );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color.fromRGBO(64, 75, 96, .9),
        title: const Text('Geloofsbelydenis'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(64, 75, 96, .9),
                ),
                child: Text(
                  'Index',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Raleway-Regular',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.book_online_outlined,
                color: Colors.blueGrey,
              ),
              title: const Text('Ekumeniese belydenise'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const BMain(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded, color: Colors.blueGrey),
              title: const Text('Heidelbergse Kategismus'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const CMain(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online, color: Colors.blueGrey),
              title: const Text('Dordtse Leerreëls'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const DMain(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmarks, color: Colors.blueGrey),
              title: const Text('Boekmerke'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const EMain(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.blueGrey),
              title: const Text('Deel hierdie Geloofsbelydenis'),
              onTap: () => {Navigator.pop(context), _onShareLink(context)},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: chapters == null ? 0 : chapters.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(chapters, index);
        },
      ),
    );
  }
}
