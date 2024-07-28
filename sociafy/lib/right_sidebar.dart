// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RightSidebar extends StatelessWidget {
  final List<Map<String, String>> onlineFriends = [
    {
      'name': 'Mikha Lim',
      'avatar': 'assets/pfp/mikha.jpg',
    },
    {
      'name': 'Maraiah Arceta',
      'avatar': 'assets/pfp/aiah.jpg',
    },
    {
      'name': 'Nicolette Vergara',
      'avatar': 'assets/pfp/colet.jpg',
    },
    {
      'name': 'Gweneth Apuli',
      'avatar': 'assets/pfp/gwen.jpg',
    },
    {
      'name': 'Mary Loi Ricalde',
      'avatar': 'assets/pfp/maloi.jpg',
    },
    {
      'name': 'Jhoanna Robles',
      'avatar': 'assets/pfp/jhoanna.jpg',
    },
    {
      'name': 'Stacey Sevilleja',
      'avatar': 'assets/pfp/stacey.jpg',
    },
    {
      'name': 'Sheena Catacutan',
      'avatar': 'assets/pfp/sheena.jpg',
    },
  ];

  RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Friends',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: onlineFriends.map((friend) {
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(friend['avatar']!),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    friend['name']!,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
