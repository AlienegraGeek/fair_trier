import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class FairDemoPage extends StatefulWidget {
  // var fairProps;

  // FairDemoPage(dynamic data, {super.key}) {
  //   fairProps = data;
  // }

  FairDemoPage({required Key key, this.data}) : super(key: key) {
    title = data['title'];
  }

  String title = '';
  dynamic data;

  @override
  State<StatefulWidget> createState() => _FairDemoPageState();
}

class _FairDemoPageState extends State<FairDemoPage> {
  @FairProps()
  var fairProps;

  var _title = 'DemoTitle';
  int _count = 0;

  // JS生命周期方法--在JS加载完成自动调用
  void onLoad() {
    _title = fairProps['title'];
  }

  void onTapText() {
    setState(() {
      _count = _count + 1;
    });
  }

  // 逻辑方法
  bool _countCanMod2() {
    return _count % 2 == 1;
  }

  @override
  void initState() {
    super.initState();
    fairProps = widget.data;
    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sugar.ifEqualBool 为逻辑和布局混编场景下的语法糖
            Sugar.ifEqualBool(_countCanMod2(),
                falseValue: Image.asset('assets/image/img1.png'),
                trueValue: Image.asset('assets/image/img2.png')),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('count = $_count'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('如果count % 2 == 1,  更换图片 !'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: onTapText,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
