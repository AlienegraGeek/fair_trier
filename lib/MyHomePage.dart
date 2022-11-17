import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

import 'FairDemoPage.dart';

@FairPatch()
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                color: Colors.grey,
                child: Text("data - $index"),
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (BuildContext context) {
              //   return FairDemoPage(data: {"title": "动态Page"});
              // }));
              Navigator.pushNamed(context, 'fair_page',
                  arguments: {
                    'name': '58Fair',   // 动态界面title
                    'path': 'assets/bundle/lib_FairDemoPage.fair.json',  // 界面内容数据
                    'data': {'title': '动态Page'} // 界面传递的参数，不需传递需要写为'data': {}
                  }
              );
            },
          );
        });
  }
}
