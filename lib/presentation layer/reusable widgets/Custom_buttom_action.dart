// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Custom_buttom.dart';

class CustomBottomAction extends StatelessWidget {
  const CustomBottomAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButtom(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            text: 'Free',
          ),
        ),
        Expanded(
          child: CustomButtom(
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            text: 'Free Preview',
            fontsize: 16,
          ),
        ),
      ],
    );
  }
}
