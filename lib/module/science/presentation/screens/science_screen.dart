import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/NewsModel.dart';
import '../../../../presentation/component/article_widget.dart';
import '../../../../presentation/cubit/news_cubit.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  void initState() {
    if (NewsCubit.i(context).scienceNewsModel == null) {
      NewsCubit.i(context).getNews("science");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: ()async{
            NewsCubit.i(context).getNews("science");
          },
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                  onTap:() async {
                    print("=>>>>> ${NewsCubit.i(context).scienceNewsModel!.articles![index].url}");
                    final Uri url =Uri.parse(NewsCubit.i(context).scienceNewsModel!.articles![index].url);
                    await launchUrl(url);

                  },
                child: ArticleWidget(
                    data: NewsCubit.i(context).scienceNewsModel!.articles![index]),
              ),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
              itemCount:
                  NewsCubit.i(context).scienceNewsModel!.articles!.length),
        );
      },
    );
  }
}
