import 'package:cebrailbarber/auth/register_page.dart';
import 'package:cebrailbarber/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../common/common_textfield.dart';
import '../const/const.dart';
import '../provider/change_notifier.dart';
import 'forgot_password.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool showPass = true;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  'images/pawprint 1 (1).svg',
                  width: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Hey,\nLogin Now",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Provider.of<AppStateNotifier>(context).isDarkMode? Colors.white:kTextColor1,fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Glad to meet you again",
                  style: TextStyle(color: kTextColor2, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 35,
                ),
                CommonTextFieldWithTitle('Email', 'Email Address', email, (val) {
                  if (val!.isEmpty) {
                    return 'This is required field';
                  }
                },
                    suffixIcon: const Icon(
                      Icons.person_pin,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 20,
                ),
                CommonTextFieldWithTitle('Password', ' Password', password,
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
                    obscure: showPass, (val) {
                  if (val!.isEmpty) {
                    return 'This is required field';
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgot_Password()));
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: kButtonColor,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? Center(
                        child: SizedBox(
                            width: 80,
                            child: LoadingIndicator(
                                indicatorType: Indicator.ballBeat,
                                colors: [
                                  Theme.of(context).primaryColor,
                                ],
                                strokeWidth: 2,
                                pathBackgroundColor: Theme.of(context).primaryColor)),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kButtonColor,
                          ),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                          )),
                        ),
                      ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log in with',
                      style: TextStyle(fontWeight: FontWeight.w500, color: kTextColor3),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), border: Border.all(color: kBorderColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/icons8-google.svg',
                                width: 30,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Google',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), border: Border.all(color: kBorderColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/icons8-facebook.svg',
                                width: 30,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Facebook',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(color: HexColor('#0e0e0e'), fontSize: 15, letterSpacing: 0.8),
                    ),
                    GestureDetector(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Register_Page()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: HexColor('#8379b4'), fontSize: 16, letterSpacing: 0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(

                    'images/Elements.svg',
                    color:  Provider.of<AppStateNotifier>(context).isDarkMode?Colors.white:Colors.black
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
