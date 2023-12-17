import 'controller/welcome_controller.dart';import 'package:flutter/material.dart';import 'package:tripmate_ori/core/app_export.dart';
class WelcomeScreen extends GetWidget<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { 
  mediaQueryData = MediaQuery.of(context); 
  return SafeArea(
    child: Scaffold(
      body: SizedBox(
        width: double.maxFinite, 
        child: Column(
          children: [CustomImageView(
            imagePath: ImageConstant.imgRectangle1, 
            height: 320.v, 
            width: 428.h
          ), 
          SizedBox(height: 76.v),
          _buildWelcomeSection(), 
          SizedBox(height: 50.v)
          ]
        )
      )
    )
  ); 
} 
/// Section Widget
Widget _buildWelcomeSection() { return Container(padding: EdgeInsets.symmetric(horizontal: 32.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text("lbl_welcome_to".tr, style: theme.textTheme.displayMedium), SizedBox(height: 23.v), Text("lbl_comfort".tr, style: theme.textTheme.displayLarge), SizedBox(height: 40.v), Container(width: 319.h, margin: EdgeInsets.only(right: 40.h), child: Text("msg_the_best_hotel_booking".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleMediumSemiBold_1.copyWith(height: 1.50)))])); } 
 }
