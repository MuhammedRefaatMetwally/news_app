
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/data/model/NewsModel.dart';

import '../../shared/network/dio_helper.dart';

abstract class _NewsRemoteDataSource{
  Future<NewsModel> getNews(String category);
  Future<NewsModel> searchNews(String text);
}

class NewsRemoteDataSource implements _NewsRemoteDataSource {

  @override
  Future<NewsModel> getNews(String category)  async {
    try{
      final Response res= await DioHelper.get(path: "top-headlines", params: {
        "country": "us",
        "category": category,
        "apiKey": "39e5cf12f1d0420b936f2c3715dfd2b1"
      });
      print("ssss ${res.data}");
      return NewsModel.fromJson(res.data );
    }catch(e){
    rethrow;
    }

  }

  @override
  Future<NewsModel> searchNews(String text) async{
    try{
      final Response res=  await DioHelper.get(
        path: "everything", params: {
        "q": text,
        "apiKey": "39e5cf12f1d0420b936f2c3715dfd2b1"
      });
      return NewsModel.fromJson(res.data);
    } catch(e){
      rethrow;
    }

  }
}
