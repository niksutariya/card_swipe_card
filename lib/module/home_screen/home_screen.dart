import 'dart:developer';

import 'package:card_swipe_task/controller/home_controller.dart';
import 'package:card_swipe_task/model/content_model.dart';
import 'package:card_swipe_task/utils/app_colors.dart';
import 'package:card_swipe_task/utils/app_icon.dart';
import 'package:card_swipe_task/utils/app_route.dart';
import 'package:card_swipe_task/utils/app_strings.dart';
import 'package:card_swipe_task/utils/app_utils.dart';
import 'package:card_swipe_task/utils/sizeutils.dart';
import 'package:card_swipe_task/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();
  late MatchEngine matchEngine;
  List<SwipeItem> swipeItems = <SwipeItem>[];
  GoogleMapController? mapController;

  @override
  void initState() {
    for (int i = 0; i < homeController.propertyList.length; i++) {
      swipeItems.add(
        SwipeItem(
          content: Content(
            addressArea: homeController.propertyList[i]?.addressArea,
            addressCity: homeController.propertyList[i]?.addressCity,
            addressCityCode: homeController.propertyList[i]?.addressCityCode,
            addressCountry: homeController.propertyList[i]?.addressCountry,
            addressCountryCode: homeController.propertyList[i]?.addressCountryCode,
            addressPostcode: homeController.propertyList[i]?.addressPostcode,
            addressStreetName: homeController.propertyList[i]?.addressStreetName,
            bathrooms: homeController.propertyList[i]?.bathrooms,
            bedrooms: homeController.propertyList[i]?.bedrooms,
            createdAt: homeController.propertyList[i]?.createdAt,
            createdBy: homeController.propertyList[i]?.createdBy,
            currentFlatmates: homeController.propertyList[i]?.currentFlatmates,
            deletedAt: homeController.propertyList[i]?.deletedAt,
            depositAmount: homeController.propertyList[i]?.depositAmount,
            description: homeController.propertyList[i]?.description,
            flatmateGender: homeController.propertyList[i]?.flatmateGender,
            floorPlan: homeController.propertyList[i]?.floorPlan,
            freeToContact: homeController.propertyList[i]?.freeToContact,
            freeWithinDays: homeController.propertyList[i]?.freeWithinDays,
            id: homeController.propertyList[i]?.id,
            isFreeToContact: homeController.propertyList[i]?.isFreeToContact,
            isSuitableForStudent: homeController.propertyList[i]?.isSuitableForStudent,
            keyFeatures: homeController.propertyList[i]?.keyFeatures,
            latitude: homeController.propertyList[i]?.latitude,
            longitude: homeController.propertyList[i]?.longitude,
            lengthOfStay: homeController.propertyList[i]?.lengthOfStay,
            listingType: homeController.propertyList[i]?.listingType,
            monthlyPrice: homeController.propertyList[i]?.monthlyPrice,
            moveInDate: homeController.propertyList[i]?.moveInDate,
            nearestLatitude: homeController.propertyList[i]?.nearestLatitude,
            nearestLocation: homeController.propertyList[i]?.nearestLocation,
            nearestLocationTime: homeController.propertyList[i]?.nearestLocationTime,
            nearestLocationType: homeController.propertyList[i]?.nearestLocationType,
            nearestLongitude: homeController.propertyList[i]?.nearestLongitude,
            personPrice: homeController.propertyList[i]?.personPrice,
            propertyFloorPlans: homeController.propertyList[i]?.propertyFloorPlans,
            propertyImages: homeController.propertyList[i]?.propertyImages,
            propertyType: homeController.propertyList[i]?.propertyType,
            propertyUrl: homeController.propertyList[i]?.propertyUrl,
            propertyVideos: homeController.propertyList[i]?.propertyVideos,
            roomType: homeController.propertyList[i]?.roomType,
            slug: homeController.propertyList[i]?.slug,
            status: homeController.propertyList[i]?.status,
            type: homeController.propertyList[i]?.type,
            updatedAt: homeController.propertyList[i]?.updatedAt,
            updatedBy: homeController.propertyList[i]?.updatedBy,
            user: homeController.propertyList[i]?.user,
            userId: homeController.propertyList[i]?.userId,
          ),
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {
            log("Region $region");
          },
        ),
      );
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const CustomText(
          title: AppString.cardDetail,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeUtils.horizontalBlockSize * 2,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            SizeUtils.horizontalBlockSize * 4,
          ),
          child: Container(
            height: SizeUtils.verticalBlockSize * 80,
            width: SizeUtils.screenWidth,
            decoration:
                _buildBoxDecoration(AppColors.black12Color, 4, backColor: AppColors.whiteColor),
            child: SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (BuildContext context, int index) {
                final value = swipeItems[index].content;
                log("value :-$value");
                return Container(
                  height: SizeUtils.verticalBlockSize * 80,
                  decoration: _buildBoxDecoration(AppColors.black12Color, 4,
                      backColor: AppColors.whiteColor),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            SizeUtils.horizontalBlockSize * 3,
                          ),
                          child: Stack(
                            children: [
                              AppUtils.imageContainer(
                                imgUrl: value?.propertyImages?.first.path ?? "",
                                fit: BoxFit.cover,
                                height: SizeUtils.verticalBlockSize * 80,
                              ),
                              Padding(
                                padding: EdgeInsets.all(SizeUtils.horizontalBlockSize * 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          title: value.addressArea,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: SizeUtils.fSize_24(),
                                        ),
                                        CircleAvatar(
                                          radius: SizeUtils.horizontalBlockSize * 5,
                                          backgroundColor: AppColors.whiteColor,
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                  SizeUtils.horizontalBlockSize * 5,
                                                ),
                                                child: AppUtils.imageContainer(
                                                  imgUrl: value.user.profileImage ?? "",
                                                  height: SizeUtils.horizontalBlockSize * 10,
                                                  width: SizeUtils.horizontalBlockSize * 10,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: SizeUtils.horizontalBlockSize * 8,
                                                right: SizeUtils.horizontalBlockSize * 3.2,
                                                child: CircleAvatar(
                                                  radius: SizeUtils.horizontalBlockSize * 2,
                                                  backgroundColor: AppColors.pinkColor,
                                                  child: Icon(
                                                    Icons.message,
                                                    color: AppColors.whiteColor,
                                                    size: SizeUtils.horizontalBlockSize * 2.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeUtils.horizontalBlockSize * 1,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeUtils.horizontalBlockSize * 2),
                                        color: AppColors.greenColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                          title: value.status,
                                          fontSize: SizeUtils.fSize_8(),
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            AppIcon.paperPlaneIcon,
                                            height: SizeUtils.horizontalBlockSize * 6,
                                          ),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 4,
                                          ),
                                          Image.asset(
                                            AppIcon.playIcon,
                                            height: SizeUtils.horizontalBlockSize * 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeUtils.verticalBlockSize * 50,
                                    ),
                                    CustomText(
                                      title: "\u{20A4}${value.monthlyPrice}",
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: SizeUtils.fSize_22(),
                                    ),
                                    SizedBox(
                                      height: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppIcon.hotelIcon,
                                          height: SizeUtils.horizontalBlockSize * 4,
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        CustomText(
                                          title: value.bedrooms.toString(),
                                          color: AppColors.whiteColor,
                                          fontSize: SizeUtils.fSize_10(),
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        Image.asset(
                                          AppIcon.bathIcon,
                                          height: SizeUtils.horizontalBlockSize * 4,
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        CustomText(
                                          title: value.bathrooms.toString(),
                                          color: AppColors.whiteColor,
                                          fontSize: SizeUtils.fSize_10(),
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        Container(
                                          height: 4,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        CustomText(
                                          title: value.nearestLocation.toString(),
                                          color: AppColors.whiteColor,
                                          fontSize: SizeUtils.fSize_10(),
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 2,
                                        ),
                                        Image.asset(
                                          AppIcon.roadIcon,
                                          height: SizeUtils.horizontalBlockSize * 4,
                                          color: AppColors.redColor,
                                        ),
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize * 1,
                                        ),
                                        CustomText(
                                          title: "${value.nearestLocationTime.toString()} walk",
                                          color: AppColors.whiteColor,
                                          fontSize: SizeUtils.fSize_10(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                SizeUtils.horizontalBlockSize * 4,
                              ),
                              bottomRight: Radius.circular(
                                SizeUtils.horizontalBlockSize * 4,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
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
                                    Obx(() {
                                      log("${homeController.markers.length}");
                                      return Container(
                                        height: SizeUtils.horizontalBlockSize * 35,
                                        decoration: _buildBoxDecoration(AppColors.black12Color, 4),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                SizeUtils.horizontalBlockSize * 4,
                                              ),
                                              child: GoogleMap(
                                                initialCameraPosition: CameraPosition(
                                                  target: LatLng(value?.latitude ?? 0.0,
                                                      value?.longitude ?? 0.0),
                                                ),
                                                onMapCreated: (controller) async {
                                                  mapController = controller;
                                                  await Future.delayed(const Duration(seconds: 1));
                                                  homeController.getMarker(value?.latitude ?? 0.0,
                                                      value?.longitude ?? 0.0);
                                                  mapController?.animateCamera(
                                                    CameraUpdate.newLatLngZoom(
                                                      LatLng(value?.latitude ?? 0.0,
                                                          value?.longitude ?? 0.0),
                                                      15,
                                                    ),
                                                  );
                                                  homeController.update();
                                                },
                                                markers: Set<Marker>.of(homeController.markers),
                                                myLocationEnabled: true,
                                                buildingsEnabled: false,
                                                mapToolbarEnabled: false,
                                                compassEnabled: false,
                                                zoomControlsEnabled: false,
                                                myLocationButtonEnabled: false,
                                              ),
                                            ),
                                            Positioned(
                                              child: InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                    Routes.mapScreen,
                                                    arguments: {
                                                      "latitude": value?.latitude,
                                                      "longitude": value?.longitude,
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
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
                                            decoration:
                                                _buildBoxDecoration(AppColors.purpleColor, 5),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                SizeUtils.horizontalBlockSize * 3,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  AppUtils.imageContainer(
                                                    imgUrl: keyFeaturesData?.colorIconUrl ?? "",
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
                                          log("${homeController.selectedIndex.value}");
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
                                                decoration:
                                                    _buildBoxDecoration(AppColors.black12Color, 4),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(
                                                        SizeUtils.horizontalBlockSize * 4,
                                                      ),
                                                      child: AppUtils.imageContainer(
                                                          imgUrl: galleryImage?.path ?? "",
                                                          fit: BoxFit.cover,
                                                          height:
                                                              SizeUtils.horizontalBlockSize * 50,
                                                          width: SizeUtils.screenWidth),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      right: SizeUtils.horizontalBlockSize * 32,
                                                      child: value?.propertyImages?.length == 1
                                                          ? const SizedBox()
                                                          : Padding(
                                                              padding: const EdgeInsets.only(
                                                                  bottom: 8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.end,
                                                                children:
                                                                    _buildPageIndicator(value!),
                                                              ),
                                                            ),
                                                    ),
                                                  ],
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
                                      padding:
                                          EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 2),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _headingTitleText(AppString.basicInfo),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          _basicDetailText(
                                              AppString.listingType, value?.listingType ?? ""),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          _basicDetailText(
                                              AppString.propertyType, value?.propertyType ?? ""),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          _basicDetailText(
                                              AppString.roomType, value?.roomType ?? ""),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          _basicDetailText(
                                              AppString.moveInDate, value?.moveInDate ?? ""),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          _basicDetailText(
                                              AppString.lengthOfStay, value?.lengthOfStay ?? ""),
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
                                          _basicDetailText(AppString.depositAmount,
                                              value?.depositAmount.toString() ?? ""),
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
                        ),
                      ],
                    ),
                  ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: CustomText(
                      title: AppString.detailFinishMessage,
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              itemChanged: (SwipeItem item, int index) {
                homeController.selectedIndex.value = 0;
              },
              upSwipeAllowed: false,
              fillSpace: true,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(Color color, double circular, {Color? backColor}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(
        SizeUtils.horizontalBlockSize * circular,
      ),
      border: Border.all(color: color),
      color: backColor,
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
      color: Colors.black38,
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

  List<Widget> _buildPageIndicator(Content data) {
    List<Widget> list = [];
    for (int i = 0; i < (data.propertyImages?.length ?? 0); i++) {
      list.add(i == homeController.selectedIndex.value
          ? AppUtils.indicator(true)
          : AppUtils.indicator(false));
    }
    return list;
  }
}
