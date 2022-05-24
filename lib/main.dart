import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helpdeskport/screen/consult/consult_page.dart';
import 'package:helpdeskport/screen/helpdesk/helpdesk_page.dart';
import 'package:helpdeskport/screen/home/home_page.dart';
import 'package:helpdeskport/screen/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          '/consultpage': (BuildContext context) => const ConsultPage(),
        });
  }
}
