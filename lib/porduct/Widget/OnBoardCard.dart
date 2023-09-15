import 'package:flutter/material.dart';
import 'package:flutter_state_managment/future/onBoard/OnBoard_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.model});
  final OnBoardModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(model.title),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}
