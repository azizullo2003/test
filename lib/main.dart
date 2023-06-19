import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:merchant_kyc_app/providers/navigation_provider.dart';
import 'package:merchant_kyc_app/screen/app_overview/app_overview_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => NavigationProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        //TODO: provide custom font
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
      home: const AppOverviewScreen(),
    );
  }
}
