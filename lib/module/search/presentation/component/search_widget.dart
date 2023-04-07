import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  const SearchWidget({Key? key, required this.controller,this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(onTap: ()=>Navigator.pop(context),child: const Icon(Icons.arrow_back,color: Colors.grey,)),
        SizedBox(width: 16.w,),
        Container(
          width: 332,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: TextFormField(
            controller: controller,
            onFieldSubmitted:onFieldSubmitted ,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.white,),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp)
            ),
          ),
        ),
      ],
    )
    ;
  }
}
