import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    _getApp(),
    plugins: {},
  );
}

dynamic _getApp() => FairApp(
      modules: {},
      delegate: {},
      child: MyApp(),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fair Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(data: {'title': 'Flutter Demo Home Page'}));
        home: FairWidget(
            name: '58 Fair',
            path: 'assets/bundle/lib_FairDemoPage.fair.json',
            data: {
              'fairProps': jsonEncode({'title': '58 Fair'})
            }));
  }
}
