import 'package:flutter/material.dart';
import 'login.dart'; 
import 'header.dart'; 
import 'home_content.dart'; 
import 'videos_content.dart'; 
import 'drawer_content.dart'; 
import 'friendreq_content.dart';
import 'notifications_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(), 
    debugShowCheckedModeBanner: false,
  ));
}

class FacebookClone extends StatefulWidget {
  const FacebookClone({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FacebookCloneState createState() => _FacebookCloneState();
}

class _FacebookCloneState extends State<FacebookClone>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(tabController: _tabController, scaffoldKey: _scaffoldKey),
      body: TabBarView(
        controller: _tabController,
        children: [
          const HomeContent(), // Display HomeContent for Home tab
          const VideosContent(), // Display VideosContent for Videos tab
          const FriendsReqContent(),
          NotificationContent(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.0, // Adjust height here
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4.0),
          ],
        ),
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              icon: Icon(FontAwesomeIcons.house),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.video),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.userGroup),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.bell),
            ),
          ],
        ),
      ),
      endDrawer: DrawerContent(), 
    );
  }
}
