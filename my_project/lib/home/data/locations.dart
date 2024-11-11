import 'package:my_project/home/data/reviews.dart';
import 'package:my_project/home/model/location.dart';

List<Location> locations = [
  Location(
    name: 'OCEANIC',
    urlImage: 'assets/images/1.jpg',
    addressLine1: 'Resort Oceanic',
    addressLine2: 'Đà Nẵng, Việt Nam',
    starRating: 5,
    latitude: '16.0668',
    longitude: '108.2523',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'Đà Nẵng',
    urlImage: 'assets/images/4.png',
    addressLine1: 'Cầu Rồng, Đà Nẵng',
    addressLine2: 'Hải Châu, Đà Nẵng, Việt Nam',
    starRating: 4,
    latitude: '16.0606',
    longitude: '108.2230',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'Thành phố Hồ Chí Minh',
    urlImage: 'assets/images/3.png',
    addressLine1: 'Khu vực trung tâm Sài Gòn',
    addressLine2: 'TP. Hồ Chí Minh, Việt Nam',
    starRating: 4,
    latitude: '10.8231',
    longitude: '106.6297',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'Hà Nội',
    urlImage: 'assets/images/2.png',
    addressLine1: 'Khu vực Hồ Gươm',
    addressLine2: 'Hà Nội, Việt Nam',
    starRating: 4,
    latitude: '21.0285',
    longitude: '105.8542',
    reviews: Reviews.allReviews,
  ),
];
