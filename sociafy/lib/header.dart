import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final TabController tabController;

  const Header({Key? key, this.scaffoldKey, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () {
            _showSearchDialog(context);
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.bars),
          onPressed: () {
            scaffoldKey?.currentState?.openEndDrawer(); // Open the end drawer
          },
        )
      ],
      title: Image.asset(
        'assets/logo.png', // Replace with your logo asset path
        width: 80, // Adjust the width as needed
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: const SizedBox(
            height: 40,
            child: TextField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                hintText: 'Type to search...',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Adjust AppBar height
}
