import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/lang_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';
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
        appBar: AppBar(
          title: textWelcome(),
          actions: [iconButtonChangeTheme()],
        ),
        floatingActionButton: floatingActionButtonIncrement,
        body: textNumber,
      );

  Text textWelcome() {
    return Text(
      (LocaleKeys.welcome.locale),
    );
  }

  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
        });
  }

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
