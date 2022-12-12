import 'package:card_swipe_task/controller/home_controller.dart';
import 'package:card_swipe_task/model/property_list_model.dart';
import 'package:card_swipe_task/utils/app_strings.dart';
import 'package:card_swipe_task/utils/app_utils.dart';
import 'package:card_swipe_task/utils/sizeutils.dart';
import 'package:card_swipe_task/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          title: AppString.cardDetail,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeUtils.horizontalBlockSize * 2,
        ),
        child: Container(
          height: SizeUtils.verticalBlockSize * 80,
          width: SizeUtils.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 4,
            ),
            border: Border.all(color: Colors.black12),
          ),
          child: PageView.builder(
            itemCount: homeController.propertyList.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              homeController.selectedIndex.value = 0;
            },
            itemBuilder: (context, index) {
              final value = homeController.propertyList[index];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeUtils.verticalBlockSize * 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeUtils.horizontalBlockSize * 4,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            value?.propertyImages?.first.path ?? "",
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) => const Center(
                              child: Text("NO IMAGE!!!"),
                            ),
                          ).image,
                        ),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Stack(children: []),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        SizeUtils.horizontalBlockSize * 3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headingTitleText(AppString.description),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 1,
                          ),
                          _subHeadingText(value?.description ?? ""),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 2,
                          ),
                          _headingTitleText(AppString.location),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 1,
                          ),
                          _subHeadingText("${value?.addressStreetName}"),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 4,
                          ),
                          Container(
                            height: SizeUtils.horizontalBlockSize * 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                SizeUtils.horizontalBlockSize * 4,
                              ),
                              border: Border.all(color: Colors.black12),
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 4,
                          ),
                          _headingTitleText(AppString.keyFeatureAndAmenities),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 2,
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 25,
                            child: ListView.builder(
                              itemCount: value?.keyFeatures?.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final keyFeaturesData = value?.keyFeatures?[index];
                                return Container(
                                  width: SizeUtils.horizontalBlockSize * 25,
                                  margin: EdgeInsets.only(
                                    right: SizeUtils.horizontalBlockSize * 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      SizeUtils.horizontalBlockSize * 5,
                                    ),
                                    border: Border.all(color: Colors.purple),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          keyFeaturesData?.colorIconUrl ?? "",
                                          height: SizeUtils.horizontalBlockSize * 12,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 30,
                                          child: CustomText(
                                            title: keyFeaturesData?.name ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            fontSize: SizeUtils.fSize_10(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 4,
                          ),
                          _headingTitleText(AppString.gallery),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 3,
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 50,
                            child: Obx(
                              () {
                                print("${homeController.selectedIndex.value}");
                                return PageView.builder(
                                  controller: homeController.pageController,
                                  itemCount: value?.propertyImages?.length,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (int page) {
                                    homeController.selectedIndex.value = page;
                                  },
                                  itemBuilder: (context, index) {
                                    final galleryImage = value?.propertyImages?[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          SizeUtils.horizontalBlockSize * 4,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(galleryImage?.path ?? "",
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return const Center(child: CircularProgressIndicator());
                                            },
                                            errorBuilder: (context, error, stackTrace) => const Center(
                                              child: Text("NO IMAGE!!!"),
                                            ),
                                          ).image,
                                        ),
                                        border: Border.all(color: Colors.black12),
                                      ),
                                      child: value?.propertyImages?.length == 1
                                          ? const SizedBox()
                                          : Padding(
                                              padding: const EdgeInsets.only(bottom: 8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: _buildPageIndicator(value!),
                                              ),
                                            ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _headingTitleText(AppString.basicInfo),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.listingType, value?.listingType ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.propertyType, value?.propertyType ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.roomType, value?.roomType ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.moveInDate, value?.moveInDate ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.lengthOfStay, value?.lengthOfStay ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.type, value?.type ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.forStudents, "Yes"),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(
                                    AppString.depositAmount, value?.depositAmount.toString() ?? ""),
                                SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 3,
                                ),
                                _basicDetailText(AppString.currentFlatmates,
                                    value?.currentFlatmates.toString() ?? ""),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _basicDetailText(String title, subTitle) {
    return Row(
      children: [
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 35,
          child: _subHeadingText(title),
        ),
        CustomText(
          title: subTitle,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _subHeadingText(String title) {
    return CustomText(
      title: title,
      color: Colors.black12,
      fontWeight: FontWeight.w500,
      fontSize: SizeUtils.fSize_12(),
    );
  }

  Widget _headingTitleText(String title) {
    return CustomText(
      title: title,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: SizeUtils.fSize_14(),
    );
  }

  List<Widget> _buildPageIndicator(Property data) {
    List<Widget> list = [];
    for (int i = 0; i < (data.propertyImages?.length ?? 0); i++) {
      list.add(i == homeController.selectedIndex.value
          ? AppUtils.indicator(true)
          : AppUtils.indicator(false));
    }
    return list;
  }
}
