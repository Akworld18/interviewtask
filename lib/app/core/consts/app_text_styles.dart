import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//----------//-----Font-Weight = 400-----//----------//

size10Weight400(){
  return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );
}

size12Weight400({required Color color}){
  return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color
  );
}



//----------//-----Font-Weight = 500-----//----------//


 size12Weight500({required Color color}){
  return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: color
  );
}


//----------//-----Font-Weight = 900-----//----------//

amountValueTextStyle({required Color color,required double fontSize}){
   return TextStyle(
       fontSize: fontSize,
       fontWeight: FontWeight.w900,
       color: color
   );
}