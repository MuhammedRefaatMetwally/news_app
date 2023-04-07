import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../presentation/component/article_widget.dart';
import '../component/search_widget.dart';
import '../../../../presentation/cubit/news_cubit.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return NewsCubit
                .i(context)
                .isSearching ? const Center(
              child: CircularProgressIndicator(),
            ) : Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 8.0.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    controller: _searchController,
                    onFieldSubmitted: (val) {
                      NewsCubit.i(context).search(val);
                    },
                  ),
                  if(NewsCubit
                      .i(context)
                      .searchNewsModel != null)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              InkWell(
                                  onTap:() async {
                                    print("=>>>>> ${NewsCubit.i(context).searchNewsModel!.articles![index].url}");
                                   final Uri url =Uri.parse(NewsCubit.i(context).searchNewsModel!.articles![index].url);

                                    await launchUrl(url);

                              }, child: ArticleWidget(data: NewsCubit
                                  .i(context)
                                  .searchNewsModel!
                                  .articles![index])),
                          separatorBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  height: 1.h,
                                  color: Colors.black.withOpacity(.4),
                                ),
                              ),
                          itemCount: NewsCubit
                              .i(context)
                              .searchNewsModel!
                              .articles!
                              .length),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
