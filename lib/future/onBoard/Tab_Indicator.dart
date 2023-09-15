import 'package:flutter/material.dart';

import 'OnBoard_model.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: OnBoardModels.onBoardModeItems.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(controller: _tabController);
  }
}
