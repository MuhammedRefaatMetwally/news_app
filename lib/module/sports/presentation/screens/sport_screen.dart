import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/NewsModel.dart';
import '../../../../presentation/component/article_widget.dart';
import '../../../../presentation/cubit/news_cubit.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key,}) : super(key: key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
@override
  void initState() {
  if(NewsCubit.i(context).sportsNewsModel==null){
    NewsCubit.i(context).getNews("sports");
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){

      },
      builder:(context,state){
        if(state is NewsLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        return RefreshIndicator(
          onRefresh: ()async{
            NewsCubit.i(context).getNews("sports");
          },
          child: ListView.separated(
              itemBuilder: (context, index) =>InkWell(onTap:() async {
                print("=>>>>> ${NewsCubit.i(context).sportsNewsModel!.articles![index].url}");
                final Uri url =Uri.parse(NewsCubit.i(context).sportsNewsModel!.articles![index].url);
                await launchUrl(url);

              },child: ArticleWidget(data:NewsCubit.i(context).sportsNewsModel!.articles![index] )),

              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 1,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
              itemCount: NewsCubit.i(context).sportsNewsModel!.articles!.length),
        );
      },
    );
  }
}