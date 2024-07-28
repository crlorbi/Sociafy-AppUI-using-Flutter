import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendRequest {
  final String userName;
  final String userProfileImage;
  String status; // Add a status field to track the status of the request

  FriendRequest({
    required this.userName,
    required this.userProfileImage,
    this.status = 'Pending', 
  });
}

class FriendsReqContent extends StatefulWidget {
  const FriendsReqContent({super.key});

  @override
  _FriendsReqContentState createState() => _FriendsReqContentState();
}

class _FriendsReqContentState extends State<FriendsReqContent> {
  final List<FriendRequest> _friendRequests = [
    FriendRequest(
      userName: 'Maria Santos',
      userProfileImage: 'assets/pfp/maria.jpg',
      status: 'Pending',
    ),
    FriendRequest(  
      userName: 'Anna Reyes',
      userProfileImage: 'assets/pfp/anna.jpg',
      status: 'Pending',
    ),
      FriendRequest(  
    userName: 'Sofia Mendoza',
    userProfileImage: 'assets/pfp/sofia.jpg',
    status: 'Pending',
  ),
      FriendRequest(  
    userName: 'Andrea Bautista',
    userProfileImage: 'assets/pfp/andrea.jpg',
    status: 'Pending',
  ),
      FriendRequest(  
    userName: 'Kristine Garcia',
    userProfileImage: 'assets/pfp/kristine.jpg',
    status: 'Pending',
  ),
      FriendRequest(  
    userName: 'Grace Villanueva',
    userProfileImage: 'assets/pfp/grace.jpg',
    status: 'Pending',
    
  ),
      FriendRequest(  
    userName: 'Isabella Cruz',
    userProfileImage: 'assets/pfp/isabella.jpg',
    status: 'Pending',
  ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Friend Requests',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          ..._friendRequests.map((request) {
            return Column(
              children: [
                _buildFriendRequest(request),
                const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFriendRequest(FriendRequest request) {
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
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(request.userProfileImage),
                  radius: 30.0, // Adjust the radius to resize the profile image
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Adjust the alignment
              children: [
                ElevatedButton(
                  onPressed: request.status == 'Pending'
                      ? () {
                          setState(() {
                            request.status = 'Accepted';
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        request.status == 'Accepted' ? Colors.grey : Colors.blue,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.check,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        request.status == 'Accepted' ? 'Accepted' : 'Accept',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between buttons
                ElevatedButton(
                  onPressed: request.status == 'Pending'
                      ? () {
                          setState(() {
                            request.status = 'Rejected';
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: request.status == 'Rejected'
                        ? Colors.red
                        : Colors.grey,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.xmark,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        request.status == 'Rejected' ? 'Rejected' : 'Reject',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
