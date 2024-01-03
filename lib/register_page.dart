import 'package:flutter/material.dart';
import 'package:real_estate/reg_login_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

late SharedPreferences pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
}

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool visibility = true;
  bool acceptTerms = false;

  TextEditingController userController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void saveUserAndPassword() async {
    pref.setString("username", userController.text);
    pref.setString("pswrd", passwordController.text);
  }

  void navigateNextPage() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        userController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Barcha kerakli maydonlarni to'ldiring.")));
    } else {
      saveUserAndPassword();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 36,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Firstname",
                    style: TextStyle(color: textColor),
                  ),
                ),
                TextField(
                  style: TextStyle(color: inputTxtColor),
                  controller: firstnameController,
                  decoration:
                  Styles.decoration(context).copyWith(hintText: 'Firstname'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Text(
                    "Lastname",
                    style: TextStyle(color: textColor),
                  ),
                ),
                TextField(
                  style: TextStyle(color: inputTxtColor),
                  controller: lastnameController,
                  decoration:
                  Styles.decoration(context).copyWith(hintText: 'Lastname'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Text(
                    "Username",
                    style: TextStyle(color: textColor),
                  ),
                ),
                TextField(
                  style: TextStyle(color: inputTxtColor),
                  controller: userController,
                  decoration:
                  Styles.decoration(context).copyWith(hintText: 'Username'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(color: textColor, fontFamily: 'Poppins'),
                  ),
                ),
                TextField(
                  style: TextStyle(color: inputTxtColor),
                  obscureText: visibility,
                  controller: passwordController,
                  decoration: Styles.decoration(context).copyWith(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        child: Icon(visibility == true
                            ? Icons.visibility
                            : Icons.visibility_off, color: inputTxtColor,),
                        onTap: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                      )),
                ),
                SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    if (acceptTerms) {
                      navigateNextPage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please accept terms and conditions")));
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
                        "Register",
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
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        acceptTerms = !acceptTerms;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                            fillColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.red;
                                }
                                return inputTxtColor;
                              },
                            ),
                            value: acceptTerms,
                            onChanged: (accept) {
                              setState(() {
                                acceptTerms = accept ?? false;
                              });
                            }),
                        Text(
                          "I accept the terms and conditions",
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF162C45),
    );
  }
}
