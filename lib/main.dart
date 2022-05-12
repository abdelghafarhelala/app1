import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/modules/aboutUsScreen/aboutUs.dart';
import 'package:app1/modules/contactUsScreen/contactUs.dart';
import 'package:app1/modules/login/login.dart';
import 'package:app1/modules/serviceDetails/serviceDetails.dart';
import 'package:app1/network/local/cache_Helper.dart';
import 'package:app1/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? mySharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  mySharedPreferences = await SharedPreferences.getInstance();
  bool isDark = false;
  if (CacheHelper.getData(key: 'isDark') != null) {
    isDark = CacheHelper.getData(key: 'isDark');
  } else {
    isDark = isDark;
  }
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp({required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..changeAppTheme(fromCache: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            locale: AppCubit.get(context).currentLang,
            debugShowCheckedModeBanner: false,
            title: 'home',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: LoginScreen(),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale local in supportLang) {
                  if (local.languageCode == currentLang.languageCode) {
                    mySharedPreferences!
                        .setString('lang', currentLang.languageCode);
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}
