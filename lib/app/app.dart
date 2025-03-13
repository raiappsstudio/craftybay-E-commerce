import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.themeColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.themeColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.themeColor)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey
          )

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            foregroundColor: Colors.white,
            backgroundColor: AppColors.themeColor,
          ),
        )


      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('bn'),
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
      ],
    );
  }
}
