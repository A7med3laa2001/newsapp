import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Cubit/cubit.dart';
import 'package:newsapp/Cubit/states.dart';
import 'package:newsapp/Network/Remote/Dio_helper.dart';

import 'search_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                 cubit.changeAppMode();
                }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.BottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
