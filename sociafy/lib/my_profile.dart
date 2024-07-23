import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'friends.dart'; 
import 'post_model.dart';

class MyProfile extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {
      'name': 'Mikha Lim',
      'avatar': 'assets/pfp/mikha.jpg',
      'online': 'true',
    },
    {
      'name': 'Maraiah Arceta',
      'avatar': 'assets/pfp/aiah.jpg',
      'online': 'false',
    },
    {
      'name': 'Nicolette Vergara',
      'avatar': 'assets/pfp/colet.jpg',
      'online': 'true',
    },
    {
      'name': 'Mary Loi Ricalde',
      'avatar': 'assets/pfp/maloi.jpg',
      'online': 'true',
    },
    {
      'name': 'Gweneth Apuli',
      'avatar': 'assets/pfp/gwen.jpg',
      'online': 'true',
    },
    {
      'name': 'Jhoanna Christine Robles',
      'avatar': 'assets/pfp/jhoanna.jpg',
      'online': 'true',
    },
    {
      'name': 'Stacey Aubrey Sevilleja',
      'avatar': 'assets/pfp/stacey.jpg',
      'online': 'true',
    },
    {
      'name': 'Sheena Mae Catacutan',
      'avatar': 'assets/pfp/sheena.jpg',
      'online': 'true',
    },
    {
      'name': 'Carlo Rabi',
      'avatar': 'assets/pfp/carlo.jpg',
      'online': 'true',
    },
    {
      'name': 'Kiervin Marasigan',
      'avatar': 'assets/pfp/kier.jpg',
      'online': 'false',
    },
    {
      'name': 'John Martin Marasigan',
      'avatar': 'assets/pfp/martin.jpg',
      'online': 'true',
    },
    {
      'name': 'Kate Rodriguez',
      'avatar': 'assets/pfp/kate.jpg',
      'online': 'true',
    },
    {
      'name': 'Roseann Capio',
      'avatar': 'assets/pfp/roseann.jpg',
      'online': 'true',
    },
    {
      'name': 'Katrina Cyrell Bobadilla',
      'avatar': 'assets/pfp/kath.jpg',
      'online': 'false',
    },
    {
      'name': 'David Aguilon',
      'avatar': 'assets/pfp/david.jpg',
      'online': 'true',
    },
    {
      'name': 'Renz Landicho',
      'avatar': 'assets/pfp/renz.jpg',
      'online': 'true',
    }, 
    // Add more friends as needed
  ];

  final List<Post> posts = [
    Post(
      userName: 'Coco Martin',
      userProfileImage: 'assets/pfp/pfp.jpg',
      postImage: 'assets/post/postjho.jpg',
      content: 'jhoanna',
      postDate: DateTime(2024, 7, 15),
    ),
    Post(
      userName: 'Coco Martin',
      userProfileImage: 'assets/pfp/pfp.jpg',
      postImage: 'assets/post/postgwen.jpg',
      content: 'gwen',
      postDate: DateTime(2024, 6, 25),
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/pfp/coverprofile.jpg', // Replace with your cover photo asset
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 120,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/pfp/pfp.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Coco Martin',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildProfileInfoRow(FontAwesomeIcons.locationDot, 'Batangas City'),
                        const SizedBox(height: 12),
                        _buildProfileInfoRow(FontAwesomeIcons.graduationCap, 'Batangas State University'),
                        const SizedBox(height: 12),
                        _buildProfileInfoRow(FontAwesomeIcons.solidHeart, 'Single'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Friends',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Show preview of 3 friends
                  FriendsList(friends: friends.sublist(0, 3)),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllFriendsScreen(friends: friends)),
                      );
                    },
                    child: const Text(
                      'View All Friends',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Posts',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPostsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 25),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 15.0, 
          ),
        ),
      ],
    );
  }

  Widget _buildPostsSection() {
    return Column(
      children: posts.map((post) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(post.userProfileImage),
                      radius: 20.0,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.userName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          _formatDate(post.postDate),
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Image.asset(
                post.postImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.0,
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  post.content,
                  style: const TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class AllFriendsScreen extends StatelessWidget {
  final List<Map<String, String>> friends;

  const AllFriendsScreen({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Friends',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(friends[index]['avatar']!),
            ),
            title: Text(
              friends[index]['name']!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: friends[index]['online'] == 'true' ? Colors.green : Colors.grey[400],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
