import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/entity/villa.dart';
import '../../utils/constants.dart';

Widget villaTitle(Villa villa) {
  String? state = Proviences[villa.state??0];
  String? city = villa.city;
  String? Logo = villa.images![0].image;
  return Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            padding: EdgeInsets.only(top: 30.h),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(8),
              child: Logo == null
                  ?Image.asset(
                EmptyImg,
                width: 200.w,
                height: 200.h,
              )
                  : Image.memory(
                base64.decode(Logo),
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    EmptyImg,
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          if (Logo == null)
            Positioned.fill(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            state??"",
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            city??"",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    ],
  );
}