import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geloofsbelydenis/cre/cre_main.dart';
import 'package:geloofsbelydenis/main/ma_detailpage.dart';
import 'package:share/share.dart';

import '../bm/bm_main.dart';
import '../cat/cat_main.dart';
import '../dort/dort_main.dart';
import 'db_model.dart';
import 'db_queries.dart';

DbQueries _dbQueries = DbQueries();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Chapter> chapters = List<Chapter>.empty();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
      future: _dbQueries.getTitleList('atexts'),
      builder: (context, AsyncSnapshot<List<Chapter>> snapshot) {
        if (snapshot.hasData) {
          chapters = snapshot.data!;
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
                      text: " ${chapters[index].title}"),
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
                    builder: (context) => MainDetailPage(index),
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
              leading: const Icon(Icons.keyboard_double_arrow_right,
                  color: Colors.blueGrey),
              title: const Text('Boekmerke'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const BkMarkMainPage(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.keyboard_double_arrow_right,
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
                        builder: (context) => const CreedsMainPage(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.keyboard_double_arrow_right,
                  color: Colors.blueGrey),
              title: const Text('Heidelbergse Kategismus'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const CatMainPage(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.keyboard_double_arrow_right,
                  color: Colors.blueGrey),
              title: const Text('Dordtse Leerreëls'),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const DortMainPage(),
                      ),
                    );
                  },
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.keyboard_double_arrow_right,
                  color: Colors.blueGrey),
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
