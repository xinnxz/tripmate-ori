import 'controller/confirm_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_leading_image.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';
import 'package:tripmate_ori/widgets/custom_elevated_button.dart';

class ConfirmPaymentScreen extends GetWidget<ConfirmPaymentController> {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 23.v),
          child: Column(
            children: [
              _buildResortDetails(),
              SizedBox(height: 28.v),
              _buildBookingDetails(),
              SizedBox(height: 28.v),
              _buildPrice(),
              SizedBox(height: 28.v),
              _buildPaymentMethod(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildConfirmPayment(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 52.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 10.v, bottom: 17.v),
        onTap: onTapArrowLeft,
      ),
      title: AppbarTitle(
          text: "lbl_payment".tr, margin: EdgeInsets.only(left: 16.h)),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgQrcode,
          margin: EdgeInsets.fromLTRB(24.h, 10.v, 24.h, 17.v),
        ),
      ],
    );
  }

  Widget _buildResortDetails() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.outlineBlackC.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle43,
            height: 100.adaptSize,
            width: 100.adaptSize,
            radius: BorderRadius.circular(16.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, bottom: 9.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_bulgari_resort".tr,
                    style: theme.textTheme.titleLarge),
                SizedBox(height: 15.v),
                Text("lbl_paris_france".tr, style: theme.textTheme.bodyMedium),
                SizedBox(height: 12.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgStarYellowA700,
                      height: 12.adaptSize,
                      width: 12.adaptSize,
                      margin: EdgeInsets.symmetric(vertical: 2.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child:
                          Text("lbl_4_8".tr, style: theme.textTheme.titleSmall),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h, top: 1.v),
                      child: Text("lbl_4_378_reviews".tr,
                          style: theme.textTheme.bodySmall),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 9.v, bottom: 6.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("lbl_27".tr, style: CustomTextStyles.headlineSmallPrimary),
                SizedBox(height: 2.v),
                Text("lbl_night".tr, style: theme.textTheme.labelMedium),
                SizedBox(height: 16.v),
                CustomImageView(
                  imagePath: ImageConstant.imgBookmarkPrimary,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 21.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          _buildAutoLayoutHorizontal(
            checkOut: "lbl_check_in".tr,
            month: "msg_december_16_2024".tr,
          ),
          SizedBox(height: 20.v),
          _buildAutoLayoutHorizontal(
            checkOut: "lbl_check_out".tr,
            month: "msg_december_20_2024".tr,
          ),
          SizedBox(height: 19.v),
          _buildAutoLayoutHorizontal(
            checkOut: "lbl_guest".tr,
            month: "lbl_3".tr,
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 21.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          _buildAutoLayoutHorizontal(
            checkOut: "lbl_5_nights".tr,
            month: "lbl_435_00".tr,
          ),
          SizedBox(height: 20.v),
          _buildAutoLayoutHorizontal(
            checkOut: "msg_taxes_fees_10".tr,
            month: "lbl_44_50".tr,
          ),
          SizedBox(height: 17.v),
          Divider(),
          SizedBox(height: 21.v),
          _buildAutoLayoutHorizontal(
            checkOut: "lbl_total".tr,
            month: "lbl_479_50".tr,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage27x44,
            height: 27.v,
            width: 44.h,
            radius: BorderRadius.circular(4.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h, top: 2.v, bottom: 2.v),
            child: Text("msg".tr, style: theme.textTheme.titleMedium),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTapTxtChange,
            child: Padding(
              padding: EdgeInsets.only(top: 5.v),
              child: Text(
                "lbl_change".tr,
                style: CustomTextStyles.titleMediumPrimarySemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmPayment() {
    return CustomElevatedButton(
      text: "lbl_confirm_payment".tr,
      margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 49.v),
      onPressed: onTapScanQR,
    );
  }

  Widget _buildAutoLayoutHorizontal({
    required String checkOut,
    required String month,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            checkOut,
            style: CustomTextStyles.titleMediumOnPrimaryContainer.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        Text(month,
            style: theme.textTheme.titleMedium!
                .copyWith(color: appTheme.whiteA700)),
      ],
    );
  }

  onTapArrowLeft() {
    Get.back();
  }

  onTapTxtChange() {
    Get.toNamed(AppRoutes.kartuAddedScreen);
  }

  onTapScanQR() {
    Get.toNamed(AppRoutes.viewTicketScreen);
  }
}
