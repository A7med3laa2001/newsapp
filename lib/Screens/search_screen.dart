import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Component/Widgets.dart';
import 'package:newsapp/Cubit/cubit.dart';
import 'package:newsapp/Cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1),
                    ),
                    label: Text("Search"),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter Your Text",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search Must Not Be Empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                  child: buildArticleBuilder(list, context, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
