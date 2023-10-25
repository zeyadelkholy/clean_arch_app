
import 'package:clean_arch_booklyapp/presentation%20layer/search%20screen/search_screen_body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchScreenBody(),
      ),
    );
  }
}
