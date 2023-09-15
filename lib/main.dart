import 'package:flutter/material.dart';

import 'future/onBoard/OnBoard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: OnBoardView());
  }
}
