// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //  physics: const NeverScrollableScrollPhysics(),
      //shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('cccc')
            //BookListViewItem(),
            );
      },
    );
  }
}
