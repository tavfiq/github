import 'package:flutter/material.dart';
import 'package:real_estate/reg_login_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'register_page.dart';

const Color firstColor = Color(0xFF7BABF6);
const Color secondColor = Color(0xFF7BABF6);
const Color textColor = Color(0xFFD1E1FB);
const Color inputTxtColor = Color(0xFF7BABF6);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();

  String? loggedInUser = pref.getString("username");

  runApp(MaterialApp(
    home: loggedInUser != null ? HomePage(loggedInUser: loggedInUser) : LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibility = true;

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String user = "";
  String password = "";

  void usernm(String user) {
    SharedPreferences.getInstance().then((SharedPreferences pref) {
      pref.setString("username", user);
    });
  }

  void pswrod(String password) {
    SharedPreferences.getInstance().then((SharedPreferences pref) {
      pref.setString("pswrd", password);
    });
  }

  Future<void> read() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      user = pref.getString("username") ?? "";
      password = pref.getString("pswrd") ?? "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                      color: textColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 20),
                      child: Text("Username", style: TextStyle(color: textColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        bottom: 32.0,
                        right: 32.0,
                        top: 2,
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: inputTxtColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                        controller: userController,
                        decoration:
                        Styles.decoration(context).copyWith(hintText: 'Username'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        "Password",
                        style: TextStyle(color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        bottom: 32.0,
                        right: 32.0,
                        top: 2,
                      ),
                      child: TextField(
                        obscureText: visibility,
                        style: TextStyle(
                            color: inputTxtColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                        controller: passwordController,
                        decoration: Styles.decoration(context).copyWith(
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              child: Icon(
                                visibility == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: inputTxtColor,
                              ),
                              onTap: () {
                                setState(() {
                                  visibility = !visibility;
                                });
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 32.0,
                        right: 32.0,
                        bottom: 12,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await read();
                          if (userController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid login")),
                            );
                          } else if (userController.text == user &&
                              passwordController.text == password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login successful")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(loggedInUser: user)),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid login")),
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF7BABF6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF162C45),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegPage()),
                          );
                        },
                        child: Text(
                          "If you have no account, Register it",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF162C45),
    );
  }
}

bool themeIdentify(BuildContext context) {
  return true; // Assuming true for demonstration purposes.
}
