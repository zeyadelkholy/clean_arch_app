import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'Core/utils/service_locator.dart';
import 'core/utils/App_router.dart';
import 'damain layer/entities/book_entity.dart';

void main() async {

  // to call the register Singleton from service locator
  setupServiceLocator();
  runApp(const BooklyApp());
  Hive.registerAdapter(BookEntityAdapter());
  await  Hive.openBox('featured_box');
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [







      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
