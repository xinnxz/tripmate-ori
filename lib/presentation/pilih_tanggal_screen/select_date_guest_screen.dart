import 'controller/select_date_guest_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_leading_image.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';
import 'package:tripmate_ori/widgets/custom_elevated_button.dart';
import 'package:tripmate_ori/widgets/custom_text_form_field.dart';

class SelectDateGuestScreen extends GetWidget<SelectDateGuestController> {
  const SelectDateGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
                child: Column(children: [
                  SizedBox(height: 7.v),
                  _buildDateCalendar(),
                  SizedBox(height: 30.v),
                  _buildBookingDetails(),
                  SizedBox(height: 22.v),
                  Text("lbl_total_435".tr, style: theme.textTheme.titleMedium)
                ])),
            bottomNavigationBar: _buildContinue()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 52.v,
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "lbl_select_date".tr, margin: EdgeInsets.only(left: 16.h)));
  }

  /// Section Widget
  Widget _buildDateCalendar() {
    return Obx(() => SizedBox(
        height: 396.v,
        width: 380.h,
        child: TableCalendar(
            locale: 'en_US',
            firstDay: DateTime(DateTime.now().year - 5),
            lastDay: DateTime(DateTime.now().year + 5),
            calendarFormat: CalendarFormat.month,
            rangeSelectionMode: controller.rangeSelectionMode.value,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            calendarStyle: CalendarStyle(
                outsideDaysVisible: false, isTodayHighlighted: true),
            daysOfWeekStyle: DaysOfWeekStyle(),
            headerVisible: false,
            focusedDay: controller.focusedDay.value,
            rangeStartDay: controller.rangeStart,
            rangeEndDay: controller.rangeEnd,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(controller.selectedDay, selectedDay)) {
                controller.focusedDay.value = focusedDay;
                controller.selectedDay = selectedDay;
                controller.rangeSelectionMode.value =
                    RangeSelectionMode.toggledOn;
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              controller.focusedDay.value = focusedDay;
              controller.rangeEnd = end;
              controller.rangeStart = start;
              controller.rangeSelectionMode.value =
                  RangeSelectionMode.toggledOn;
            },
            onPageChanged: (focusedDay) {
              controller.focusedDay.value = focusedDay;
            })));
  }

  /// Section Widget
  Widget _buildBookingDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_check_in".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          CustomTextFormField(
              width: 160.h,
              controller: controller.decCounterController,
              hintText: "lbl_dec_16".tr,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconlyCurvedCalendarPrimary,
                      height: 20.adaptSize,
                      width: 20.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              contentPadding:
                  EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v))
        ]),
        CustomImageView(
            imagePath: ImageConstant.imgMenuWhiteA70020x20,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(top: 51.v, bottom: 18.v)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_check_out".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          Container(
              width: 160.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.v),
              decoration: AppDecoration.fillBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: Text("lbl_dec_20".tr,
                            style: CustomTextStyles.titleSmallWhiteA700)),
                    CustomImageView(
                        imagePath: ImageConstant.imgIconlyCurvedCalendarPrimary,
                        height: 20.adaptSize,
                        width: 20.adaptSize)
                  ]))
        ])
      ]),
      SizedBox(height: 30.v),
      Text("lbl_guest".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 15.v),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 82.h, vertical: 11.v),
          decoration: AppDecoration.outlineGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: 52.adaptSize,
                width: 52.adaptSize,
                padding: EdgeInsets.all(16.h),
                decoration: AppDecoration.outlineIndigoA
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: CustomImageView(
                    imagePath: ImageConstant.imgFrameWhiteA70020x20,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    alignment: Alignment.center)),
            Padding(
                padding: EdgeInsets.only(top: 10.v, bottom: 12.v),
                child: Text("lbl_3".tr, style: theme.textTheme.headlineSmall)),
            Container(
                height: 52.adaptSize,
                width: 52.adaptSize,
                padding: EdgeInsets.all(16.h),
                decoration: AppDecoration.outlineIndigoA
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: CustomImageView(
                    imagePath: ImageConstant.imgFrame20x20,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    alignment: Alignment.center))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        text: "lbl_continue".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 33.v),
        onPressed: () {
          onTapContinue();
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the bookingNameTabContainerScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.bookingNameTabContainerScreen,
    );
  }
}
