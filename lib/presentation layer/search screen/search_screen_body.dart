import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Core/utils/App_Styles.dart';
import '../reusable widgets/custom_search_textfield.dart';
import '../reusable widgets/search_result_listview.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
       slivers: [
         SliverFillRemaining(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 CustomSearchTextField(),
                 SizedBox(height: 20,),
                 Text('Search Result', style: Styles.textStyle18),
                 SizedBox(height: 20,),

                 Expanded(child: SearchResultListView()),

               ],
             ) ,
           )
         )
       ],
    );



  }
}
