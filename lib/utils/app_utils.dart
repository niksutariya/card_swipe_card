import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppUtils{
  static Widget indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 12:8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: const Color(0XFF2FB7B2).withOpacity(0.72),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  static imageContainer({
    String? imgUrl,
    double? size,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return imgUrl != null || imgUrl != ""
        ? CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imgUrl ?? "",
      fit: fit,
      placeholder: (context, url) => const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        padding: const EdgeInsets.all(30),
        color: Colors.grey.withOpacity(0.5),
        child: Icon(
          Icons.image,
          color: Colors.white,
          size: size ?? 0.0,
        ),
      ),
    )
        : Container(
      color: Colors.grey.withOpacity(0.5),
      child: Icon(
        Icons.image,
        color: Colors.white,
        size: size ?? 0.0,
      ),
    );
  }
}