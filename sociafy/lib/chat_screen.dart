import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  final String sender;
  final String avatar;

  const ChatScreen({super.key, required this.sender, required this.avatar});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {'sender': 'Mikha Lim', 'message': 'San ka na?', 'time': '11:00 AM', 'isMe': false},
    {'sender': 'You', 'message': 'ow suree!', 'time': '10:36 AM', 'isMe': true},
    {'sender': 'Mikha Lim', 'message': 'Meet tayo later?', 'time': '10:35 AM', 'isMe': false},
    // Add more messages as needed
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.avatar),
              radius: 20.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.sender,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.video),
            onPressed: () {
              // Implement video call action
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.phone),
            onPressed: () {
              // Implement call action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              reverse: true, // Start from bottom
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    bool isMe = message['isMe'];
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message['message'],
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Poppins', // Custom font family for message text
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              message['time'],
              style: const TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto', // Custom font family for time
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          IconButton(
            icon: const Icon(FontAwesomeIcons.solidPaperPlane),
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                _sendMessage(_messageController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String messageText) {
    setState(() {
      messages.insert(
        0,
        {
          'sender': 'You',
          'message': messageText,
          'time': _getTime(),
          'isMe': true,
        },
      );
      _messageController.clear();
    });
    // Simulate receiving a response after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _receiveMessage();
    });
  }

  void _receiveMessage() {
    setState(() {
      messages.insert(
        0,
        {
          'sender': widget.sender,
          'message': 'This is an automated response.',
          'time': _getTime(),
          'isMe': false,
        },
      );
    });
  }

  String _getTime() {
    DateTime now = DateTime.now();
    String formattedTime = '${now.hour}:${now.minute}';
    return formattedTime;
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
