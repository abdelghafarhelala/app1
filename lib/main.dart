import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? mySharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mySharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            locale: AppCubit.get(context).currentLang,
            debugShowCheckedModeBanner: false,
            title: 'home',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
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
