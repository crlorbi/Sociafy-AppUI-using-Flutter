// post_model.dart
class Post {
  final String userName;
  final String userProfileImage;
  final String postImage;
  final String content;
  final DateTime postDate;
  bool isLiked;

  Post({
    required this.userName,
    required this.userProfileImage,
    required this.postImage,
    required this.content,
    required this.postDate,
    this.isLiked = false,
  });
}

