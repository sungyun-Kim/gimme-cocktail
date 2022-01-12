import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      children: getSampleContainers(12),
      diameterRatio: 3,
      itemExtent: 100,
    );
  }
}

TextStyle textStyle = const TextStyle(fontSize: 24);

List<Widget> getSampleContainers(int numberOfItems) {
  var list = <Widget>[];

  for (var i = 1; i <= numberOfItems; i++) {
    list.add(Container(
      padding: const EdgeInsets.all(0),
      child: Text(
        "test $i",
        style: textStyle,
      ),
    ));
  }

  return list;
}
