import 'package:cebrailbarber/const/static_info.dart';
import 'package:cebrailbarber/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:provider/provider.dart';
import '../common/common_textfield.dart';
import '../const/const.dart';
import '../provider/change_notifier.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  TextEditingController email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  //bool l = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
 //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(

        actions: <Widget>[
          Switch(
            value: Provider.of<AppStateNotifier>(context).isDarkMode,
            onChanged: (boolVal) {
              Provider.of<AppStateNotifier>(context, listen: false).updateTheme(boolVal);
            },
          )
        ],

       title: const Text("Forgot Password"),
       centerTitle: true,
        //elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // const Center(
              //     child: Text(
              //   "Forgot Password",
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black,
              //       fontSize: 26),
              //   textAlign: TextAlign.center,
              // )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "please Enter your email to reset \nyour password",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 95,
              ),
              CommonTextFieldWithTitle(
                'Email',
                'Enter Your email address',
                email,
                (val) {
                  if (val!.isEmpty) {
                    return 'This is required field';
                  }
                },
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
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
                              pathBackgroundColor:
                                  Theme.of(context).primaryColor)),
                    )
                  : GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                      ),
                    ),

            ],
          ),
        ),
      ),
    );
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      isDarkModeEnabled = isDarkModeEnabled;
      print(isDarkModeEnabled);
    });
  }
}
