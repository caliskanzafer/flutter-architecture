import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_view.dart';

class TestsView extends StatefulWidget {
  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: '',
      onPageBuilder: (context, value) => Text('data'),
    );
  }
}
