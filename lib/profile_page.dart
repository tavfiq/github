import 'package:flutter/material.dart';

import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final String? loggedInUser;
  const ProfilePage({super.key, this.loggedInUser});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: defaultColor,
      ),
      body: ListView(
        children: [
          SizedBox(height: 50),
          Icon(Icons.person, color: Colors.grey.shade900,size: 64,),
          Text("Username: ${widget.loggedInUser}", textAlign: TextAlign.center, style:  TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}
