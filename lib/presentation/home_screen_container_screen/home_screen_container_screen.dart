import 'controller/home_screen_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:tripmate_ori/core/app_export.dart';
import 'package:tripmate_ori/presentation/booking_ongoing_tab_container_page/booking_ongoing_tab_container_page.dart';
import 'package:tripmate_ori/presentation/home_screen_tab_container_page/home_screen_tab_container_page.dart';
import 'package:tripmate_ori/presentation/profile_settings_page/profile_settings_page.dart';
import 'package:tripmate_ori/presentation/search_page_tab_container_page/search_page_tab_container_page.dart';
import 'package:tripmate_ori/widgets/custom_bottom_bar.dart';

class HomeScreenContainerScreen
    extends GetWidget<HomeScreenContainerController> {
  const HomeScreenContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homeScreenTabContainerPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenTabContainerPage;
      case BottomBarEnum.Search:
        return AppRoutes.searchPageTabContainerPage;
      case BottomBarEnum.Booking:
        return AppRoutes.bookingOngoingTabContainerPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileSettingsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenTabContainerPage:
        return HomeScreenTabContainerPage();
      case AppRoutes.searchPageTabContainerPage:
        return SearchPageTabContainerPage();
      case AppRoutes.bookingOngoingTabContainerPage:
        return BookingOngoingTabContainerPage();
      case AppRoutes.profileSettingsPage:
        return ProfileSettingsPage();
      default:
        return DefaultWidget();
    }
  }
}
