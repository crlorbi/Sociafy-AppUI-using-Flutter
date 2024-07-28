import 'package:flutter/material.dart';
import 'my_profile.dart';
import 'messages_screen.dart';
import 'login.dart'; // Import your login form
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerContent extends StatelessWidget {
  final List<Map<String, String>> onlineFriends = [
    {
      'name': 'Mikha Lim',
      'avatar': 'assets/pfp/mikha.jpg',
      'online': 'true',
    },
    {
      'name': 'David Aguilon',
      'avatar': 'assets/pfp/david.jpg',
      'online': 'true',
    },
    {
      'name': 'Nicolette Vergara',
      'avatar': 'assets/pfp/colet.jpg',
      'online': 'true',
    },
    {
      'name': 'Gweneth Apuli',
      'avatar': 'assets/pfp/gwen.jpg',
      'online': 'true',
    },
    {
      'name': 'Roseann Capio',
      'avatar': 'assets/pfp/roseann.jpg',
      'online': 'true',
    },
    {
      'name': 'Jhoanna Robles',
      'avatar': 'assets/pfp/jhoanna.jpg',
      'online': 'true',
    },
    {
      'name': 'Katrina Cyrell Bobadilla',
      'avatar': 'assets/pfp/kath.jpg',
      'online': 'true',
    },
    {
      'name': 'Sheena Catacutan',
      'avatar': 'assets/pfp/sheena.jpg',
      'online': 'true',
    },
    {
      'name': 'Carlo Rabi',
      'avatar': 'assets/pfp/carlo.jpg',
      'online': 'true',
    },
    {
      'name': 'John Martin Panganiban',
      'avatar': 'assets/pfp/martin.jpg',
      'online': 'true',
    },
    {
      'name': 'Kiervin Marasigan',
      'avatar': 'assets/pfp/kier.jpg',
      'online': 'true',
    },
  ];

  DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 15,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.solidComments),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MessagesScreen()), // Navigate to MessagesScreen
                      );
                    },
                  ),
                ),
                const Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/pfp/pfp.jpg'), // Replace with your profile picture
                      radius: 40,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Coco Martin', // Replace with your name
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black, // Change the color to your desired color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'View Profile',
              style: TextStyle(
                fontFamily: 'Poppins', // Change font to Poppins
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Online Friends',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: onlineFriends.map((friend) {
                bool isOnline = friend['online'] == 'true';
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(friend['avatar']!),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the end
                    children: [
                      Text(
                        friend['name']!,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      if (isOnline)
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.green,
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.rightFromBracket),
            title: const Text(
              'Log out',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
