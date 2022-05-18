import 'package:flutter/material.dart';
import 'package:helpdeskport/screen/helpdesk/helpdesk_page.dart';
import 'package:helpdeskport/screen/home/home_page.dart';
import 'package:helpdeskport/screen/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Port Chamados',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
        routes: <String, WidgetBuilder>{
          '/homepage': (BuildContext context) => const HomePage(),
          '/helppage': (BuildContext context) => const HelpDeskPage(),
        });
  }
}

