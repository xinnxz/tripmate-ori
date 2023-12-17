import '../../../core/app_export.dart';
import 'searchpagelist_item_model.dart';

/// This class defines the variables used in the [search_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel {
  Rx<List<SearchpagelistItemModel>> searchpagelistItemList = Rx([
    SearchpagelistItemModel(
        presidentHotel: ImageConstant.imgRectangle4100x100.obs,
        presidentHotel1: "Grand Aston".obs,
        parisFrance: "Cipanas, Puncak".obs,
        fortyEight: "4.8".obs,
        reviews: "(4,378 reviews)".obs,
        price: "Rp.1.950.000".obs,
        night: "/ malam".obs),
    SearchpagelistItemModel(
        presidentHotel: ImageConstant.imgRectangle41.obs,
        presidentHotel1: "Villa Sabrina Bumi".obs,
        parisFrance: "Cipanas, Puncak".obs,
        fortyEight: "4.8".obs,
        reviews: "(4,378 reviews)".obs,
        price: "Rp.290.000".obs,
        night: "/ malam".obs),
    SearchpagelistItemModel(
        presidentHotel: ImageConstant.imgRectangle43.obs,
        presidentHotel1: "Villa Miky".obs,
        parisFrance: "Cipanas, Puncak".obs,
        fortyEight: "4.8".obs,
        reviews: "(4,378 reviews)".obs,
        price: "27".obs,
        night: "/ malam".obs)
  ]);
}
