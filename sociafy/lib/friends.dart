import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  final List<Map<String, String>> friends;

  const FriendsList({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: friends.map((friend) => _buildFriendTile(friend)).toList(),
    );
  }

  Widget _buildFriendTile(Map<String, String> friend) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding as needed
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(friend['avatar']!),
          ),
          const SizedBox(width: 16.0), // Adjust spacing between avatar and name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                friend['name']!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: friend['online'] == 'true' ? Colors.green : Colors.grey[400],
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
