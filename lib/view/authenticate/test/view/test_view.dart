import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_widget.dart';
import 'package:flutter_architecture/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestsView extends StatefulWidget {
  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text('data'),
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonIncrement,
        body: textNumber,
      );

  FloatingActionButton get floatingActionButtonIncrement =>
      FloatingActionButton(
        onPressed: () => viewModel.incrementNumber(),
      );

  Widget get textNumber => Observer(
        builder: (context) => Text(
          viewModel.number.toString(),
        ),
      );
}
