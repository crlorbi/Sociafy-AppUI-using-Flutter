import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Mikha Lim',
      'message': 'San ka na?',
      'time': '11:00 AM',
      'avatar': 'assets/pfp/mikha.jpg',
      'online': true,
    },
    {
      'sender': 'Gweneth Apuli',
      'message': 'Let\'s meet up later!',
      'time': 'Yesterday',
      'avatar': 'assets/pfp/gwen.jpg',
      'online': false,
    },
    {
      'sender': 'Sheena Mae Catacutan',
      'message': 'eyyyy!',
      'time': '2 hours ago',
      'avatar': 'assets/pfp/sheena.jpg',
      'online': true,
    },
    {
      'sender': 'Stacey Aubrey Sevilleja',
      'message': 'coffee date?',
      'time': '2 minutes ago',
      'avatar': 'assets/pfp/stacey.jpg',
      'online': true,
    },
    {
      'sender': 'Mary Loi Ricalde',
      'message': 'whatt?',
      'time': '2 hours ago',
      'avatar': 'assets/pfp/maloi.jpg',
      'online': false,
    },
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Messages',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius for the input field
                      borderSide: BorderSide.none, // Remove the default border line
                    ),
                    filled: true, // Set the background color of the input field
                    fillColor: Colors.grey[300], // Background color of the input field
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  ),
              onChanged: (value) {
                // Implement search query handling
                // Update the list based on search input
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(message['avatar']),
                        radius: 28.0,
                      ),
                      if (message['online'] == true)
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
                    message['sender'],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    message['message'],
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Text(
                    message['time'],
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    // Navigate to ChatScreen when a message is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          sender: message['sender'],
                          avatar: message['avatar'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to create a new chat
          // For example, navigate to a new chat screen or show a modal bottom sheet
          // This example simply shows a snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create new chat',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(FontAwesomeIcons.penToSquare),
      ),
    );
  }
}
