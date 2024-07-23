import 'package:flutter/material.dart';

class Notification {
  final String userName;
  final String userProfileImage;
  final String notificationText;
  final DateTime notificationDate;

  Notification({
    required this.userName,
    required this.userProfileImage,
    required this.notificationText,
    required this.notificationDate,
  });
}

class NotificationContent extends StatelessWidget {
  final List<Notification> _notifications = [
    Notification(
      userName: 'Mikha Lim',
      userProfileImage: 'assets/pfp/mikha.jpg',
      notificationText: 'liked your post.',
      notificationDate: DateTime(2024, 7, 15, 10, 30),
    ),
    Notification(
      userName: 'Mary Loi Ricalde',
      userProfileImage: 'assets/pfp/maloi.jpg',
      notificationText: 'commented on your photo.',
      notificationDate: DateTime(2024, 7, 15, 9, 45),
    ),
    Notification(
      userName: 'Gweneth Apuli',
      userProfileImage: 'assets/pfp/gwen.jpg',
      notificationText: 'shared your post.',
      notificationDate: DateTime(2024, 7, 17, 9, 45),
    ),
    Notification(
      userName: 'David Aguilon',
      userProfileImage: 'assets/pfp/david.jpg',
      notificationText: 'liked your post.',
      notificationDate: DateTime(2024, 7, 18, 3, 45),
    ),
    Notification(
      userName: 'Carlo Rabi',
      userProfileImage: 'assets/pfp/carlo.jpg',
      notificationText: 'commented on your post.',
      notificationDate: DateTime(2024, 7, 18, 5, 45),
    ),
    Notification(
      userName: 'Renz Landicho',
      userProfileImage: 'assets/pfp/renz.jpg',
      notificationText: 'shared your post.',
      notificationDate: DateTime(2024, 7, 18, 2, 45),
    ),
    Notification(
      userName: 'Kiervin Marasigan',
      userProfileImage: 'assets/pfp/kier.jpg',
      notificationText: 'liked your post.',
      notificationDate: DateTime(2024, 7, 18, 1, 45),
    ),
    Notification(
      userName: 'John Martin Panganiban',
      userProfileImage: 'assets/pfp/martin.jpg',
      notificationText: 'shared your post.',
      notificationDate: DateTime(2024, 7, 18, 3, 45),
    ),
    Notification(
      userName: 'Roseann Capio',
      userProfileImage: 'assets/pfp/roseann.jpg',
      notificationText: 'commented on your post.',
      notificationDate: DateTime(2024, 7, 17, 3, 45),
    ),
    Notification(
      userName: 'Kate Rodriguez',
      userProfileImage: 'assets/pfp/kate.jpg',
      notificationText: 'shared your post.',
      notificationDate: DateTime(2024, 7, 18, 2, 45),
    ),
    Notification(
      userName: 'Mikha Lim',
      userProfileImage: 'assets/pfp/mikha.jpg',
      notificationText: 'sent a message.',
      notificationDate: DateTime(2024, 7, 18, 3, 08),
    ),
    Notification(
      userName: 'Kristine Garcia',
      userProfileImage: 'assets/pfp/kristine.jpg',
      notificationText: 'sent you a friend request.',
      notificationDate: DateTime(2024, 7, 18, 9, 45),
    ),

  ];

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      if (difference.inMinutes % 60 == 0) {
        return '${difference.inHours} hours ago';
      } else {
        int remainingMinutes = difference.inMinutes % 60;
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} and $remainingMinutes minute${remainingMinutes > 1 ? 's' : ''} ago';
      }
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sort notifications by date in descending order (most recent first)
    _notifications.sort((a, b) => b.notificationDate.compareTo(a.notificationDate));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(notification.userProfileImage),
                      radius: 20.0,
                    ),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: notification.userName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                          ),
                          TextSpan(
                            text: ' ${notification.notificationText}',
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      _formatDateTime(notification.notificationDate),
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: NotificationContent(),
      ),
    );
  }
}
