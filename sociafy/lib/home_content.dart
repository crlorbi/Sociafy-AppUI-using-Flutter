import 'package:flutter/material.dart';
import 'post_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Post> _posts = [
    Post(
      userName: 'Stacey Sevilleja',
      userProfileImage: 'assets/pfp/stacey.jpg',
      postImage: 'assets/post/poststacey.jpg',
      content: 'caption...',
      postDate: DateTime(2024, 6, 28),
    ),
    Post(
      userName: 'Mary Loi Ricalde',
      userProfileImage: 'assets/pfp/maloi.jpg',
      postImage: 'assets/post/postmaloi.jpg',
      content: 'caption...',
      postDate: DateTime(2024, 7, 12),
    ),
    Post(
      userName: 'Sheena Catacutan',
      userProfileImage: 'assets/pfp/sheena.jpg',
      postImage: 'assets/post/postsheena.jpg',
      content: 'caption...',
      postDate: DateTime(2024, 5, 14),
    ),
    Post(
      userName: 'Gweneth Apuli',
      userProfileImage: 'assets/pfp/gwen.jpg',
      postImage: 'assets/post/postgwen.jpg',
      content: 'caption...',
      postDate: DateTime(2024, 5, 13),
    ),
    Post(
      userName: 'Kiervin Maraigan',
      userProfileImage: 'assets/pfp/kier.jpg',
      postImage: 'assets/post/postkier3.jpg',
      content: 'atleast we met',
      postDate: DateTime(2024, 7, 18),
    ),
    Post(
      userName: 'John Martin Panganiban',
      userProfileImage: 'assets/pfp/martin.jpg',
      postImage: 'assets/post/postmartin.jpg',
      content: 'Corinthians 13: 4-7. “Love is patient, love is kind. It does not envy, it does not boast, it is not proud.',
      postDate: DateTime(2024, 7, 18),
    ),
    Post(
      userName: 'Roseann Marasigan',
      userProfileImage: 'assets/pfp/roseann.jpg',
      postImage: 'assets/post/postkier.jpg',
      content: 'mwaaa!',
      postDate: DateTime(2024, 7, 17),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
        _buildWhatsOnYourMind(),
        const Divider(),
        _buildFeed(),
      ],
    );
  }

  Widget _buildWhatsOnYourMind() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/pfp/pfp.jpg'),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0, // Adjust the font size as needed
                    ),
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0), // Border radius for the input field
                        borderSide: BorderSide.none, // Remove the default border line
                      ),
                      filled: true, // Set the background color of the input field
                      fillColor: Colors.grey[300], // Background color of the input field
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOptionButton('Events', FontAwesomeIcons.calendar),
                _buildOptionButton('Photo/Video', FontAwesomeIcons.camera),
                _buildOptionButton('Feeling', FontAwesomeIcons.faceSmileWink),
              ],
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                // Handle posting action
              },
              child: const Text(
                'Post',
                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, IconData icon) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          // Handle button press
        },
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 4.0),
            Text(
              text,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeed() {
    return Column(
      children: _posts.map((post) {
        return Column(
          children: [
            _buildPost(post),
            const Divider(),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildPost(Post post) {
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
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionIconButtonWithBorder(FontAwesomeIcons.solidHeart, 'Like', () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                  });
                }, post.isLiked),
                _buildActionIconButtonWithBorder(FontAwesomeIcons.solidComment, 'Comment', () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildCommentDialog(post),
                  );
                }, false),
                _buildActionIconButtonWithBorder(FontAwesomeIcons.share, 'Share', () {
                  // Handle share action
                }, false),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  Widget _buildActionIconButtonWithBorder(IconData icon, String text, VoidCallback onPressed, bool isLiked) {
    if (icon == FontAwesomeIcons.share) {
      return Expanded(
        child: InkWell(
          onTap: () {
            // Show modal bottom sheet on share button press
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidComments),
                        title: const Text(
                          'Share in Message',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.clipboard),
                        title: const Text(
                          'Copy Link',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Icon(icon, size: 20.0, color: Colors.black),
                const SizedBox(height: 2.0),
                Text(text, style: const TextStyle(fontSize: 15.0, fontFamily: 'Poppins')),
              ],
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Icon(icon, size: 20.0, color: isLiked ? Colors.red : Colors.black),
                const SizedBox(height: 2.0),
                Text(text, style: const TextStyle(fontSize: 15.0, fontFamily: 'Poppins')),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildCommentDialog(Post post) {
    TextEditingController commentController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Comments',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 12.0),
            _buildComment('John Doe', 'Nice photo!', 'assets/pfp/colet.jpg'),
            _buildComment('Jane Smith', 'Great shot!', 'assets/pfp/jhoanna.jpg'),
            // Add more comments as needed
            const SizedBox(height: 8.0),
            TextField(
              controller: commentController,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Handle adding comment action
                String newComment = commentController.text.trim();
                if (newComment.isNotEmpty) {
                  // Add your logic to save the comment
                  commentController.clear();
                }
              },
              child: const Text(
                'Post',
                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String userName, String comment, String userProfileImage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userProfileImage),
            radius: 16.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 4.0),
                Text(
                  comment,
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  void dispose() {
    super.dispose();
  }
}
