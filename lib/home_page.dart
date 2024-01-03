import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/details_page.dart';
import 'package:real_estate/main.dart';
import 'package:real_estate/profile_page.dart';
import 'package:real_estate/widget.dart';


const Color defaultColor = Color(0xFF38B3BB);
const Color yellowColor = Color(0xFFF1A717);
const Color bgColor = Color(0xFFF4F5F7);

class HomePage extends StatefulWidget {
  final String? loggedInUser;

  const HomePage({super.key, this.loggedInUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Homebhase"),
        centerTitle: true,
        backgroundColor: defaultColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications,),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  child: Icon(Icons.person, color: defaultColor, size: 64),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: defaultColor),
                    onTap: () => Navigator.pop(context),
                    title: Text(
                      "H O M E",
                      style: TextStyle(color: defaultColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.person, color: defaultColor),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfilePage(
                                loggedInUser: widget.loggedInUser))),
                    title: Text(
                      "P R O F I L E",
                      style: TextStyle(color: defaultColor),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: defaultColor),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage())),
                title:
                    Text("L O G O U T", style: TextStyle(color: defaultColor)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png", width: 200, height: 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 32),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search Here...",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: defaultColor),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details3()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset("assets/home2.jpg",
                                    fit: BoxFit.cover),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Let's buy a house",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Discount 10%",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "27 Dec 2023",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details2()));
                        },
                        child: CustomContainer(
                          title: "The House of Life",
                          cost: "\$ 285/mo",
                          rating: "4.5",
                          room: "2 rooms meet",
                          image: 'assets/home1.jpg',
                        ),
                      ),
                      SizedBox(height: 20),
                      Popular(),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details3()));
                        },
                        child: CustomContainer(
                          title: "Blackberry Cottage",
                          cost: "\$ 81/mo",
                          rating: "3.6",
                          room: "1 room meet",
                          image: 'assets/home2.jpg',
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details4()));
                        },
                        child: CustomContainer(
                          title: "Willow Barn",
                          cost: "\$ 239/mo",
                          rating: "4.2",
                          room: "2 rooms meet",
                          image: 'assets/home3.jpg',
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details5()));
                        },
                        child: CustomContainer(
                          title: "Hunters Wood",
                          cost: "\$ 361/mo",
                          rating: "4.1",
                          room: "1 rooms meet",
                          image: 'assets/home4.jpg',
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details6()));
                        },
                        child: CustomContainer(
                          title: "House Slynt",
                          cost: "\$ 519/mo",
                          rating: "4.9",
                          room: "5 rooms meet",
                          image: 'assets/home5.jpg',
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Details7()));
                        },
                        child: CustomContainer(
                          title: "Pine View",
                          cost: "\$ 471/mo",
                          rating: "3.4",
                          room: "2 rooms meet",
                          image: 'assets/home7.jpg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
