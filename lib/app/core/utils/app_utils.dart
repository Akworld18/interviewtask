import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_design_task/app/core/z_core_mixin_export.dart';

mixin AppUtils{


  BoxShadow boxShadowOne(){
    return BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(0,1)// changes position of shadow
    );
  }

  BoxShadow boxShadowTwo(){
    return BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 3,
      offset: Offset(-1, -1), // changes position of shadow
    );
  }


  //this text is used show Dollar values
  showValueText({
    required double fontSize,
    required String text,
    required Color fontColor
  }
      ){
    return Text(text,style:amountValueTextStyle(fontSize: fontSize,color: fontColor),
    );
  }



  showDivider({
    required double left,
    required double top,
    required double right,
    required Color color,
  }){
    return Padding(
      padding:  EdgeInsets.only(left: left,top: top,right: right),
      child: Divider(
        thickness: 1.sp,
        color: color,
      ),
    );
  }

  //this text is used for value titles
  cashBalanceText({
    required String title,
    required Color color
  }){
    return Text(title,style:size12Weight500(color: color));
  }


  productDetailsCard(
  {
    required Widget? child,
}
      ){
    return Container(
      height: 155.sp,
      width: 0.92.sw,
      decoration: BoxDecoration(
          boxShadow: [
            boxShadowOne(),
            boxShadowTwo()
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp)
      ),
      child:child ,
    );
  }

  //This is a padding widget that includes a default value of 0, but it allows you to set the desired value as needed.
  paddingWidget( {Widget? child, double left=0, double right = 0, double top=0, double bottom=0}){
    return Padding(
        padding:  EdgeInsets.only(bottom: bottom,left: left,right:
        right,top: top),
      child: child,
    );
  }

  spaceBetweenRow({
    required List<Widget> children,
}){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children
    );
  }

  //This is a column widget that has its default cross-axis alignment set to "start," but you have the flexibility to set it to your desired axis alignment.
  defaultColumnAxis(
  {
    required List<Widget> children,
    CrossAxisAlignment crossAxisAlignment=CrossAxisAlignment.start,
}
      ){
    return Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children
    );
  }

}