import 'package:card_swipe_task/model/property_list_model.dart';

class Content {
  final int? id;
  final int? userId;
  final String? addressStreetName;
  final String? addressArea;
  final String? addressCity;
  final String? addressPostcode;
  final dynamic addressCountry;
  final dynamic addressCityCode;
  final String? addressCountryCode;
  final double? latitude;
  final double? longitude;
  final String? propertyType;
  final String? listingType;
  final String? roomType;
  final int? monthlyPrice;
  final int? personPrice;
  final int? bedrooms;
  final int? bathrooms;
  final String? moveInDate;
  final String? lengthOfStay;
  final String? type;
  final int? isSuitableForStudent;
  final int? depositAmount;
  final int? currentFlatmates;
  final dynamic flatmateGender;
  final dynamic floorPlan;
  final String? description;
  final String? slug;
  final double? nearestLatitude;
  final double? nearestLongitude;
  final String? nearestLocation;
  final String? nearestLocationTime;
  final String? nearestLocationType;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? propertyUrl;
  final String? status;
  final bool? isFreeToContact;
  final String? freeToContact;
  final String? freeWithinDays;
  final User? user;
  final List<PropertyImageElement>? propertyVideos;
  final List<PropertyImageElement>? propertyImages;
  final List<dynamic>? propertyFloorPlans;
  final List<KeyFeature>? keyFeatures;

  Content({
    this.id,
    this.userId,
    this.addressStreetName,
    this.addressArea,
    this.addressCity,
    this.addressPostcode,
    this.addressCountry,
    this.addressCityCode,
    this.addressCountryCode,
    this.latitude,
    this.longitude,
    this.propertyType,
    this.listingType,
    this.roomType,
    this.monthlyPrice,
    this.personPrice,
    this.bedrooms,
    this.bathrooms,
    this.moveInDate,
    this.lengthOfStay,
    this.type,
    this.isSuitableForStudent,
    this.depositAmount,
    this.currentFlatmates,
    this.flatmateGender,
    this.floorPlan,
    this.description,
    this.slug,
    this.nearestLatitude,
    this.nearestLongitude,
    this.nearestLocation,
    this.nearestLocationTime,
    this.nearestLocationType,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.propertyUrl,
    this.status,
    this.isFreeToContact,
    this.freeToContact,
    this.freeWithinDays,
    this.user,
    this.propertyVideos,
    this.propertyImages,
    this.propertyFloorPlans,
    this.keyFeatures,
  });
}
