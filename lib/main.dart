import 'package:calculator_app/cubit/cubit.dart';
import 'package:calculator_app/screens/home_screen.dart';
import 'package:calculator_app/shared/components/constant.dart';
import 'package:calculator_app/shared/cubit/cubit.dart';
import 'package:calculator_app/shared/cubit/states.dart';
import 'package:calculator_app/shared/network/local/cache_helper.dart';
import 'package:calculator_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key:'isDark');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool isDark;
  MyApp( {super.key,
    required this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>AppCubit()..changeAppMode(
            fromShared: isDark,
          ),),
        BlocProvider(
          create: (BuildContext context) =>CalculatorCubit()),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false ,
            theme: lightTheme,
            darkTheme: darkTheme,
            // themeMode: ThemeMode.light,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light, //AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

