// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Core/utils/App_Styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.count})
      : super(key: key);
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          size: 14,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(rating.toString(), style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          '$count',
          style: Styles.textStyle14.copyWith(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
