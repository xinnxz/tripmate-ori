import 'controller/profile_settings_controller.dart';
import 'models/profile_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_leading_image.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';
import 'package:tripmate_ori/widgets/custom_elevated_button.dart';
import 'package:tripmate_ori/widgets/custom_switch.dart';

class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsPage({Key? key}) : super(key: key);

  ProfileSettingsController controller =
      Get.put(ProfileSettingsController(ProfileSettingsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 30.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfile(),
              SizedBox(height: 60.v),
              CustomElevatedButton(
                height: 28.v,
                width: 140.h,
                text: "lbl_edit_profile".tr,
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 20.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                  ),
                ),
                buttonStyle: CustomButtonStyles.none,
                buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
                onPressed: onTapEditProfile,
              ),
              SizedBox(height: 30.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconlyCurvedWallet,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h, top: 5.v),
                    child: Text(
                      "lbl_payment".tr,
                      style: CustomTextStyles.titleMediumSemiBold_1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.v),
              CustomElevatedButton(
                height: 28.v,
                width: 140.h,
                text: "lbl_notifications".tr,
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 20.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgIcons,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                  ),
                ),
                buttonStyle: CustomButtonStyles.none,
                buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
                onPressed: onTapNotifications,
              ),
              SizedBox(height: 30.v),
              CustomElevatedButton(
                height: 28.v,
                width: 140.h,
                text: "lbl_security".tr,
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 20.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkWhiteA700,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                  ),
                ),
                buttonStyle: CustomButtonStyles.none,
                buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
                onPressed: onTapSecurity,
              ),
              SizedBox(height: 30.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Gunakan ini agar ikon dan teks sejajar
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconlyCurvedInfo,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h, top: 5.v),
                    child: Text(
                      "lbl_help".tr,
                      style: CustomTextStyles.titleMediumSemiBold_1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.v),
              _buildDarkTheme(),
              SizedBox(height: 30.v),
              GestureDetector(
                onTap: onTapLogout,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Gunakan ini agar ikon dan teks sejajar
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRefresh,
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h, top: 5.v),
                      child: Text(
                        "lbl_logout".tr,
                        style: CustomTextStyles.titleMediumRed400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 50.v,
      leadingWidth: 56.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgGoogle,
        margin: EdgeInsets.only(left: 24.h, top: 9.v, bottom: 9.v),
        onTap: onTapGoogle,
      ),
      title: AppbarTitle(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgClock,
          margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        SizedBox(
          height: 120.adaptSize,
          width: 120.adaptSize,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse120x120,
                height: 120.adaptSize,
                width: 120.adaptSize,
                radius: BorderRadius.circular(60.h),
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgEdit,
                height: 30.adaptSize,
                width: 30.adaptSize,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),
        Text("lbl_daniel_austin".tr, style: theme.textTheme.headlineSmall),
        SizedBox(height: 11.v),
        Text(
          "lbl_uder_domain_com".tr,
          style: CustomTextStyles.titleSmallWhiteA700,
        ),
      ],
    );
  }

  Widget _buildDarkTheme() {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEye,
          height: 28.adaptSize,
          width: 28.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 3.v),
          child: Text(
            "lbl_dark_theme".tr,
            style: CustomTextStyles.titleMediumSemiBold_1,
          ),
        ),
        Spacer(),
        Obx(
          () => CustomSwitch(
            value: controller.isSelectedSwitch.value,
            onChange: (value) {
              controller.isSelectedSwitch.value = value;
            },
          ),
        ),
      ],
    );
  }

  onTapGoogle() async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }

  onTapEditProfile() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }

  onTapNotifications() {
    Get.toNamed(AppRoutes.notificationSettingsScreen);
  }

  onTapSecurity() {
    Get.toNamed(AppRoutes.securityScreen);
  }

  onTapLogout() {
    Get.toNamed(AppRoutes.signInScreen);
  }
}
