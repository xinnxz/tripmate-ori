import 'controller/booking_ongoing_tab_container_controller.dart';
import 'models/booking_ongoing_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/presentation/booking_cancelled_page/booking_cancelled_page.dart';
import 'package:tripmate_ori/presentation/booking_completed_page/booking_completed_page.dart';
import 'package:tripmate_ori/presentation/booking_ongoing_page/booking_ongoing_page.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_leading_image.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_title.dart';
import 'package:tripmate_ori/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tripmate_ori/widgets/app_bar/custom_app_bar.dart';

class BookingOngoingTabContainerPage extends StatelessWidget {
  BookingOngoingTabContainerPage({Key? key}) : super(key: key);

  BookingOngoingTabContainerController controller = Get.put(
      BookingOngoingTabContainerController(
          BookingOngoingTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 30.v),
              _buildTabview(),
              SizedBox(
                height: 667.v,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    BookingOngoingPage(),
                    BookingCompletedPage(),
                    BookingCancelledPage(),
                  ],
                ),
              ),
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
        text: "lbl_my_bookings".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchWhiteA700,
          margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v),
        ),
      ],
    );
  }

  Widget _buildTabview() {
    return Container(
      height: 45.v,
      width: 380.h,
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA700,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(22.h),
        ),
        tabs: [
          Tab(child: Text("lbl_ongoing".tr)),
          Tab(child: Text("lbl_completed".tr)),
          Tab(child: Text("lbl_cancelled".tr)),
        ],
      ),
    );
  }

  onTapGoogle() async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }
}
