import 'controller/onboarding_tiga_controller.dart';import 'package:flutter/material.dart';import 'package:smooth_page_indicator/smooth_page_indicator.dart';import 'package:tripmate_ori/core/app_export.dart';import 'package:tripmate_ori/widgets/custom_elevated_button.dart';class OnboardingTigaScreen extends GetWidget<OnboardingTigaController> {const OnboardingTigaScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: SizedBox(width: double.maxFinite, child: Column(children: [CustomImageView(imagePath: ImageConstant.imgRectangle12, height: 420.v, width: 428.h), SizedBox(height: 38.v), _buildInfoSection(), SizedBox(height: 99.v), SizedBox(height: 8.v, child: AnimatedSmoothIndicator(activeIndex: 0, count: 3, effect: ScrollingDotsEffect(spacing: 6, activeDotColor: theme.colorScheme.primary, dotColor: appTheme.gray700, dotHeight: 8.v, dotWidth: 8.h))), SizedBox(height: 30.v), _buildSkipSection(), SizedBox(height: 5.v)])))); } 
/// Section Widget
Widget _buildInfoSection() { return Container(padding: EdgeInsets.symmetric(horizontal: 43.h), child: Column(children: [Container(width: 338.h, padding: EdgeInsets.only(bottom: 20.v), child: Text("msg_let_s_discover_the".tr, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: theme.textTheme.headlineLarge!.copyWith(height: 1.50))), SizedBox(height: 5.v), SizedBox(width: 341.h, child: Text("msg_lorem_ipsum_dolor".tr, maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: CustomTextStyles.bodyLarge18.copyWith(height: 1.50)))])); } 
/// Section Widget
Widget _buildSkipSection() { return Padding(padding: EdgeInsets.symmetric(horizontal: 24.h), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [CustomElevatedButton(width: 180.h, text: "lbl_skip".tr, buttonStyle: CustomButtonStyles.fillBlueGray, onPressed: () {onTapSkip();}), CustomElevatedButton(width: 180.h, text: "lbl_next".tr, margin: EdgeInsets.only(left: 20.h), onPressed: () {onTapNext();})])); } 
/// Navigates to the loginScreen when the action is triggered.
onTapSkip() { Get.toNamed(AppRoutes.loginScreen, ); } 
/// Navigates to the loginScreen when the action is triggered.
onTapNext() { Get.toNamed(AppRoutes.loginScreen, ); } 
 }
