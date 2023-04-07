import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme_data/theme_data.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:news_app/presentation/screens/layout_screen.dart';
import 'package:news_app/shared/local/shared_prefrence.dart';
import 'package:news_app/shared/network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init(); // lazem await 3shan tt7fz
  final SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  final bool? isLight = await sharedPrefHelper.getData("isLightMode");
  DioHelper.init();
  runApp(MyApp(
    appTheme: AppTheme(),
    isLight: isLight,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme, this.isLight});

  final AppTheme appTheme;
  final bool? isLight;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit()..getModeFromSharedPref(isLight),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state)=>ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child)=>MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: appTheme.getTheme(false),
            darkTheme: appTheme.getTheme(true),
            themeMode: NewsCubit.i(context).isLightMode
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const LayoutScreen(),
          ),
        ),

      ),
    );
  }
}
