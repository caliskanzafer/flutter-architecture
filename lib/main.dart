import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/init/navigation/navigation_route.dart';
import 'package:flutter_architecture/core/init/navigation/navigation_service.dart';
import 'package:flutter_architecture/core/init/notifier/provider_list.dart';
import 'package:flutter_architecture/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constant.dart';
import 'core/init/lang/lang_manager.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstant.LANG_ASSET_PATH,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: MaterialApp(
          theme:
              Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
          home: TestsView(),
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
        ));
  }
}
