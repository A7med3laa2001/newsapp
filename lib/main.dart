import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Cubit/cubit.dart';
import 'package:newsapp/Cubit/states.dart';
import 'Network/Remote/Dio_helper.dart';
import 'Screens/Home_Layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  //await CacheHelper.init();
  
  //bool? isDark = CacheHelper.getData("isDark");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  iconTheme: IconThemeData(color: Colors.black)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,backgroundColor: Colors.white),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ))
          ),
          darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Color(0xff333739),
              appBarTheme: AppBarTheme(
                  color: Color(0xff333739),
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Color(0xff333739),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  iconTheme: IconThemeData(color: Colors.white)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Color(0xff333739),
                  unselectedItemColor: Colors.grey),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ))),
          themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: Directionality(textDirection: TextDirection.ltr, child: Home()),
        ),
      ),
    );
  }
}
