import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/NewsModel.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.data}) : super(key: key);
  final Article data;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    return Row(
      children: [
        FancyShimmerImage(imageUrl: data.urlToImage ??
            "https://qc.yaschools.com/img/anonymous.jpg", height: 124.h, width:screenSize.width/3,boxFit: BoxFit.cover,),
         SizedBox(width: 8.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title ?? "",
                style:Theme.of(context).textTheme.bodyLarge ,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
              Text(data.description ?? "", style:Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,),
              Text(data.publishedAt ?? "", style: Theme.of(context).textTheme.bodySmall),

            ],
          ),
        )
      ],
    );
  }
}
