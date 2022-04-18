import 'package:app1/main.dart';
import 'package:app1/network/local/cache_Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  Locale? currentLang;
  void changeLang() {
    if (mySharedPreferences?.getString('lang') == 'ar') {
      currentLang = const Locale('en', '');
    } else {
      currentLang = const Locale('ar', '');
    }
    emit(AppChangeLanguageState());
  }

  var isDark = true;
  void changeAppTheme({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
      emit(AppChangeThemState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemState());
      });
    }
  }
}
