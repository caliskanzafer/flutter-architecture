import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/core/constants/enum/app_theme_enum.dart';
import 'package:flutter_architecture/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;
BuildContext context;

void setContext(BuildContext context) {
  context = context;
}

abstract class _TestViewModelBase with Store {
  @observable
  int number = 0;
  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }
}
