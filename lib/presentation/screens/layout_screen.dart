import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/science/presentation/screens/science_screen.dart';
import 'package:news_app/module/search/presentation/screens/search_screen.dart';
import 'package:news_app/module/sports/presentation/screens/sport_screen.dart';

import '../cubit/news_cubit.dart';
import '../../module/bussiness/presentation/screens/business_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, newsState) {},
      builder: (context, newsState) {
        final cubit = NewsCubit.i(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
              "News",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SearchScreen(),));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
              IconButton(
                onPressed: () => cubit.changeLightMode(),
                icon: const Icon(Icons.dark_mode),
                color: Colors.grey,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: "Business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: "Science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "Sport"),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
