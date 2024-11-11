// reviews.dart
import 'package:my_project/home/model/review.dart';

class Reviews {
  static List<Review> allReviews = [
    Review(
      date: 'FEB 14th',
      username: 'Ntphuc',
      urlImage: 'assets/images/1.jpg',
      description:
          'Konichiwa',
    ),
    Review(
      date: 'JAN 24th',
      username: 'Phuc nè',
      urlImage: 'assets/images/2.png',
      description:
          'Test',
    ),
    Review(
      date: 'MAR 18th',
      username: 'Ngphuc',
      urlImage: 'assets/images/3.png',
      description:
          'Ahaiyo',
    ),
    Review(
      date: 'AUG 15th',
      username: 'Hehe',
      urlImage: 'assets/images/4.png',
      description:
          'Konbanwa',
    ),
  ];
}
