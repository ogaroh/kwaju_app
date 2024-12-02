import 'package:assessment/l10n/l10n.dart';
import 'package:assessment/shared/theme/theme.dart';
import 'package:assessment/shared/theme/util.dart';
import 'package:assessment/shopping/view/pages/shopping_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = createTextTheme(context, 'Inter', 'Inter');

    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),

      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //   ),
      //   scaffoldBackgroundColor: Colors.white,
      //   useMaterial3: true,
      // ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ShoppingPage(),
    );
  }
}
