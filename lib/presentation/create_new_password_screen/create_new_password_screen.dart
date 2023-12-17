import 'controller/create_new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/core/utils/validation_functions.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_leading_image.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';
import 'package:tripmate_ori/widgets/custom_checkbox_button.dart';
import 'package:tripmate_ori/widgets/custom_elevated_button.dart';
import 'package:tripmate_ori/widgets/custom_text_form_field.dart';

class CreateNewPasswordScreen extends GetWidget<CreateNewPasswordController> {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 56.v),
            child: Column(
              children: [
                SizedBox(height: 16.v),
                CustomImageView(
                  imagePath: ImageConstant.imgImage300x300,
                  height: 300.adaptSize,
                  width: 300.adaptSize,
                ),
                SizedBox(height: 58.v),
                _buildForgotPassword(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildContinueButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 52.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 16.v),
        onTap: onTapArrowLeft,
      ),
      title: AppbarTitle(
          text: "lbl_forgot_password".tr, margin: EdgeInsets.only(left: 16.h)),
    );
  }

  Widget _buildForgotPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_create_your_new".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 23.v),
        Obx(
          () => CustomTextFormField(
            controller: controller.newpasswordController,
            hintText: "lbl".tr,
            textInputType: TextInputType.visiblePassword,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgLockWhiteA700,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(maxHeight: 60.v),
            suffix: InkWell(
              onTap: () {
                controller.isShowPassword.value =
                    !controller.isShowPassword.value;
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDashboardWhiteA700,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: 60.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: controller.isShowPassword.value,
            contentPadding: EdgeInsets.symmetric(vertical: 21.v),
          ),
        ),
        SizedBox(height: 24.v),
        Obx(
          () => CustomTextFormField(
            controller: controller.passwordController,
            hintText: "lbl".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgLockWhiteA700,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(maxHeight: 60.v),
            suffix: InkWell(
              onTap: () {
                controller.isShowPassword1.value =
                    !controller.isShowPassword1.value;
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDashboardWhiteA700,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: 60.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: controller.isShowPassword1.value,
            contentPadding: EdgeInsets.symmetric(vertical: 21.v),
          ),
        ),
        SizedBox(height: 24.v),
        Obx(
          () => CustomCheckboxButton(
            text: "lbl_remember_me".tr,
            value: controller.rememberme.value,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            onChange: (value) {
              controller.rememberme.value = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return CustomElevatedButton(
      text: "lbl_continue".tr,
      margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 49.v),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }
}
