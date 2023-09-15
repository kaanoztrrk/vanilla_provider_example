import 'package:flutter/material.dart';
import 'package:flutter_state_managment/future/onBoard/OnBoard_model.dart';
import 'package:flutter_state_managment/future/onBoard/Tab_Indicator.dart';
import 'package:flutter_state_managment/porduct/Padding/Padding.dart';
import 'package:flutter_state_managment/porduct/Widget/OnBoardCard.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final String _skiptitle = "Skip";
  bool get _isLastPage =>
      OnBoardModels.onBoardModeItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  void _incremedAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _checkBackEnable(true);
      return;
    }
    _checkBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _checkBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: PagePadding.all(),
              child: _pageView(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabIndicator(selectedIndex: _selectedIndex),
              _floatingActionButton()
            ],
          )
        ],
      ),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
        onPressed: () {
          _incremedAndChange();
        },
        child: Text(_isLastPage ? "Start" : "Next"));
  }

  PageView _pageView() {
    return PageView.builder(
      onPageChanged: (value) {
        _incremedAndChange(value);
      },
      itemCount: OnBoardModels.onBoardModeItems.length,
      itemBuilder: (context, index) => OnBoardCard(
        model: OnBoardModels.onBoardModeItems[index],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          ValueListenableBuilder(
            valueListenable: isBackEnable,
            builder: (context, value, child) {
              return value
                  ? SizedBox()
                  : TextButton(onPressed: () {}, child: Text(_skiptitle));
            },
          )
        ],
        leading: _isFirstPage
            ? null
            : const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.grey));
  }
}
