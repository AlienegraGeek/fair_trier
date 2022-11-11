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
      child: MaterialApp(
        home: FairWidget(
            name: 'DynamicWidget',
            path: 'assets/bundle/lib_src_page_dynamic_widget.fair.json',
            data: {"fairProps": json.encode({})}),
      ),
    );
