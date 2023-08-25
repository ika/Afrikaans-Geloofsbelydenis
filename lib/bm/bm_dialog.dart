import 'package:flutter/material.dart';
import 'package:geloofsbelydenis/bm/bm_model.dart';
import 'package:geloofsbelydenis/bm/bm_queries.dart';

BmQueries _bmQueries = BmQueries();

class BmDialog {
  SnackBar bmExistsSnackBar = const SnackBar(
    content: Text('Die boekmerk reeds bestaan.'),
  );

  SnackBar bmAddedSnackBar = const SnackBar(
    content: Text('Boekmerk bygevoeg.'),
  );

  Future confirmDialog(BuildContext context, arr) async {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text(arr[0]), // title
        content: Text(arr[1]), // subtitle
        actions: [
          TextButton(
            child: const Text('NEE',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child:
                const Text('JA', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
      context: context,
    );
  }

  void bMWrapper(BuildContext context, arr) {
    _bmQueries.getBookMarkExists(int.parse(arr[2]), int.parse(arr[3])).then(
      (value) {
        if (value < 1) {
          confirmDialog(context, arr).then(
            (value) {
              if (value) {
                final model = BmModel(
                    title: arr[0].toString(),
                    subtitle: arr[1].toString(),
                    detail: arr[2],
                    page: arr[3]);
                _bmQueries.saveBookMark(model).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(bmAddedSnackBar);
                });
              }
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(bmExistsSnackBar);
        }
      },
    );
  }
}
