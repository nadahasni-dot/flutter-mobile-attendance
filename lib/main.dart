import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/theme.dart';
import 'routes/app_pages.dart';
import 'routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      getPages: AppPages.appPages,
      initialRoute: RouteNames.home,
    );
  }
}
