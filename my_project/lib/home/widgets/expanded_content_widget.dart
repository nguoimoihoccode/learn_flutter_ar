import 'package:flutter/material.dart';
import 'package:my_project/home/data/hero_tag.dart';
import 'package:my_project/home/data/locations.dart';
import 'package:my_project/home/model/location.dart';
import 'package:my_project/home/widgets/hero_widget.dart';
import 'package:my_project/home/widgets/starts_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Location location;

  const ExpandedContentWidget({
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1),
            ),
            const SizedBox(height: 8),
            buildAddressRating(location: location),
            const SizedBox(height: 12),
            buildReview(location: location)
          ],
        ),
      );

  Widget buildAddressRating({
    required Location location,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: HeroWidget(
              tag: HeroTag.addressLine2(location),
              child: Text(
                location.addressLine2,
                style: const TextStyle(color: Colors.black45),
                overflow: TextOverflow.ellipsis, // Thêm dòng này để giới hạn chữ
              ),
            ),
          ),
          HeroWidget(
            tag: HeroTag.stars(location),
            child: StarsWidget(stars: location.starRating),
          ),
        ],
      );


  Widget buildReview({
    required Location location,
  }) =>
      Row(
        children: location.reviews.map((review) {
          final pageIndex = locations.indexOf(location);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: HeroWidget(
              tag: HeroTag.avatar(review, pageIndex),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage(review.urlImage),
              ),
            ),
          );
        }).toList(),
      );
}