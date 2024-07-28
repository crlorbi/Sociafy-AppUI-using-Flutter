import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Video Posts'),
        ),
        body: const VideosContent(),
      ),
    );
  }
}

class VideoPost {
  final String userName;
  final String userProfileImage;
  final String videoUrl;
  final String content;
  final DateTime postDate;
  bool isLiked;
  bool isPlaying; // New field to track video playing state

  VideoPost({
    required this.userName,
    required this.userProfileImage,
    required this.videoUrl,
    required this.content,
    required this.postDate,
    this.isLiked = false,
    this.isPlaying = false, // Initialize with false (not playing)
  });
}

class VideosContent extends StatefulWidget {
  const VideosContent({super.key});

  @override
  _VideosContentState createState() => _VideosContentState();
}

class _VideosContentState extends State<VideosContent> {
  final List<VideoPost> _videoPosts = [
    VideoPost(
      userName: 'Renz Landicho',
      userProfileImage: 'assets/pfp/renz.jpg',
      videoUrl: 'assets/videopost/post1.mp4',
      content: 'BINI Gwen',
      postDate: DateTime(2024, 6, 28),
    ),
    VideoPost(
      userName: 'Carlo Rabi',
      userProfileImage: 'assets/pfp/carlo.jpg',
      videoUrl: 'assets/videopost/post4.mp4',
      content: 'yeahhhhh',
      postDate: DateTime(2024, 7, 12),
    ),
    VideoPost(
      userName: 'Andrea Bautista',
      userProfileImage: 'assets/pfp/andrea.jpg',
      videoUrl: 'assets/videopost/post5.mp4',
      content: 'miming',
      postDate: DateTime(2024, 7, 12),
    ),
    VideoPost(
      userName: 'Kristine Garcia',
      userProfileImage: 'assets/pfp/kristine.jpg',
      videoUrl: 'assets/videopost/post3.mp4',
      content: 'cuteee',
      postDate: DateTime(2024, 7, 12),
    ),
    VideoPost(
      userName: 'Isabella Cruz',
      userProfileImage: 'assets/pfp/isabella.jpg',
      videoUrl: 'assets/videopost/post6.mp4',
      content: 'HAHAHAHA',
      postDate: DateTime(2024, 7, 12),
    ),
  ];

  final TextStyle nameTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  final TextStyle captionTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
  );

  final TextStyle buttonTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Videos',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        ..._videoPosts.map((post) {
          return Column(
            children: [
              _buildVideoPost(post),
              const Divider(),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildVideoPost(VideoPost post) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Pause all other videos before playing this one
          for (var video in _videoPosts) {
            video.isPlaying = false;
          }
          post.isPlaying = !post.isPlaying;
        });
      },
      child: Container(
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
                        style: nameTextStyle,
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
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 9 / 16, // Portrait aspect ratio
                  child: VideoPlayerWidget(videoUrl: post.videoUrl, isPlaying: post.isPlaying),
                ),
                if (!post.isPlaying)
                  const Center(
                    child: Icon(Icons.play_arrow, size: 50.0, color: Colors.white),
                  ),
              ],
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                post.content,
                style: captionTextStyle, // Apply captionTextStyle here
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
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => _buildShareBottomSheet(post),
                    );
                  }, false),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIconButtonWithBorder(IconData icon, String text, VoidCallback onPressed, bool isLiked) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Icon(icon, size: 20.0, color: isLiked ? Colors.red : Colors.black),
              const SizedBox(height: 2.0),
              Text(text, style: buttonTextStyle), // Apply buttonTextStyle here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentDialog(VideoPost post) {
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
            _buildComment('Mikha Lim', 'Nice video!', 'assets/pfp/mikha.jpg'),
            _buildComment('Gweneth Apuli', 'Awesome content!', 'assets/pfp/gwen.jpg'),
            const SizedBox(height: 12.0),
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

  Widget _buildShareBottomSheet(VideoPost post) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.solidComments),
            title: const Text('Share in Message', style: TextStyle(fontFamily: 'Poppins', fontSize: 15)),
            onTap: () {
              Navigator.pop(context); // Close bottom sheet
              // Implement share in message action
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.clipboard),
            title: const Text('Copy Link', style: TextStyle(fontFamily: 'Poppins', fontSize: 15)),
            onTap: () {
              Navigator.pop(context); // Close bottom sheet
              // Implement copy link action
            },
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
    // Clean up resources like video controllers if needed
    super.dispose();
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isPlaying;

  const VideoPlayerWidget({super.key, required this.videoUrl, required this.isPlaying});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
    _controller.setLooping(true); // Loop video playback
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          VideoPlayer(_controller),
          if (!_controller.value.isInitialized)
            Container(
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
