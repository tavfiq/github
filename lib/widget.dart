import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String cost;
  final String rating;
  final String room;
  final String image;

  CustomContainer({
    required this.title,
    required this.cost,
    required this.rating,
    required this.room,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 240,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(cost,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            width: 100,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),
                                Text(rating)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(room,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  String dropdownValue = "Other";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            "Popular today",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          items: <String>['Other', 'Luxury', 'Cheap'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: defaultColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              // Add logic here based on the selected value
              if (newValue == 'Luxury') {
              } else if (newValue == 'Cheap') {
              } else if (newValue == 'Other') {}
            });
          },
          underline: Container(
            height: 0, // Hide the default underline
          ),
          icon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: defaultColor,
            ),
          ),
        ),
      ],
    );
  }
}


/// ---Details Page
///

class Details extends StatefulWidget {
  final String text;
  final String about;
  final String price;
  final String? loggedInUser;
  final String pageId;

  Details({
    Key? key,
    required this.text,
    required this.about,
    required this.price,
    this.loggedInUser,
    required this.pageId,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> comments = [];
  TextEditingController commentController = TextEditingController();
  bool like = false;

  final List<String> imagePaths = [
    "assets/home_in.jpg",
    "assets/home_in2.jpg",
    "assets/home_in3.jpg",
  ];

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadComments();
  }

  loadComments() {
    final List<String>? savedComments = prefs.getStringList('${widget.pageId}_comments');
    if (savedComments != null) {
      setState(() {
        comments = savedComments;
      });
    }
  }

  saveComments() {
    prefs.setStringList('${widget.pageId}_comments', comments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: Stack(
              children: [
                PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Icon(Icons.star, color: Colors.orangeAccent.shade100),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.text,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Icon(
                              like == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: like ? Colors.red : Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                like = !like;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.about,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(37.422131, -122.084801),
                            zoom: 14,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId("demo"),
                              position: LatLng(37.422131, -122.084801),
                            ),
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Comments",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F2F3),
                        ),
                        child: Icon(Icons.person, color: defaultColor),
                      ),
                      title: Container(
                        child: Text(
                          "${widget.loggedInUser ?? 'User'}: ${comments[index]}",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        controller: commentController,
                        onChanged: (value) {
                          // Save comments whenever text changes
                          saveComments();
                        },
                        decoration: InputDecoration(
                          hintText: "Type comment...",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (commentController.text.isNotEmpty) {
                                setState(() {
                                  comments.add(commentController.text);
                                  commentController.clear();
                                  saveComments();
                                });
                              }
                            },
                            child: Icon(Icons.send, color: defaultColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: defaultColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Price", style: TextStyle(fontSize: 16)),
                  Text(
                    widget.price,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    "Pay now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
