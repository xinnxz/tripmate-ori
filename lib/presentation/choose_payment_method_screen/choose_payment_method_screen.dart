import 'controller/choose_payment_method_controller.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';
import 'package:tripmate_ori/widgets/custom_elevated_button.dart';

class ChoosePaymentMethodScreen
    extends GetWidget<ChoosePaymentMethodController> {
  const ChoosePaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
          child: Column(
            children: [
              _buildAddNewCard(),
              SizedBox(height: 24.v),
              _buildPaymentMethodsGoogle(
                userImage: ImageConstant.imgFrameLightBlue600,
                googlePayLabel: "lbl_paypal".tr,
              ),
              SizedBox(height: 28.v),
              _buildPaymentMethodsGoogle(
                userImage: ImageConstant.imgFrame,
                googlePayLabel: "lbl_google_pay".tr,
              ),
              SizedBox(height: 28.v),
              _buildPaymentMethodsGoogle(
                userImage: ImageConstant.imgFrameWhiteA70032x32,
                googlePayLabel: "lbl_apple_pay".tr,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildContinue(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 52.h,
      leading: Container(
        height: 28.adaptSize,
        width: 28.adaptSize,
        margin: EdgeInsets.only(left: 24.h, top: 10.v, bottom: 17.v),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 28.adaptSize,
              width: 28.adaptSize,
              alignment: Alignment.topLeft,
              onTap: onTapImgArrowLeft,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 28.adaptSize,
              width: 28.adaptSize,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
      title: Container(
        height: 29.v,
        width: 96.h,
        margin: EdgeInsets.only(left: 16.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AppbarTitle(text: "lbl_payment".tr),
            AppbarTitle(text: "lbl_payment".tr),
          ],
        ),
      ),
      actions: [
        Container(
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.fromLTRB(24.h, 10.v, 24.h, 17.v),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgQrcode,
                height: 28.adaptSize,
                width: 28.adaptSize,
                alignment: Alignment.topRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgQrcode,
                height: 28.adaptSize,
                width: 28.adaptSize,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddNewCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "lbl_payment_methods".tr,
          style: theme.textTheme.titleMedium,
        ),
        GestureDetector(
          onTap: onTapTxtAddNewCard,
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "lbl_add_new_card".tr,
              style: CustomTextStyles.titleMediumPrimary16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinue() {
    return CustomElevatedButton(
      text: "lbl_continue".tr,
      margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 49.v),
      onPressed: onTapContinue,
    );
  }

  Widget _buildPaymentMethodsGoogle({
    required String userImage,
    required String googlePayLabel,
  }) {
    return Container(
      padding: EdgeInsets.all(24.h),
      decoration: AppDecoration.outlineBlack9000c.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: userImage,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 2.v),
            child: Text(
              googlePayLabel,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.whiteA700,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgContrast,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(top: 6.v, right: 8.h, bottom: 6.v),
          ),
        ],
      ),
    );
  }

  onTapImgArrowLeft() {
    Get.back();
  }

  onTapTxtAddNewCard() {
    Get.toNamed(AppRoutes.addKartuKreditScreen);
  }

  onTapContinue() {
    Get.toNamed(AppRoutes.confirmPaymentScreen);
  }
}
