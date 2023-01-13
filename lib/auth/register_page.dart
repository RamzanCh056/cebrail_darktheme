import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../common/common_textfield.dart';
import '../const/const.dart';
import '../provider/change_notifier.dart';
import 'login_page.dart';

class Register_Page extends StatefulWidget {
  bool isFromBiometricPage;

  Register_Page({this.isFromBiometricPage = false});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  bool checkedValue = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController user = TextEditingController();

  bool showPass = true;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'images/arrow back left.svg',
              color:  Provider.of<AppStateNotifier>(context).isDarkMode?Colors.white:Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, color:Provider.of<AppStateNotifier>(context).isDarkMode?Colors.white: Colors.black, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create Account for meet new Friends!",
                  style: TextStyle( fontSize: 13, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 35,
                ),
                CommonTextFieldWithTitle(
                  '',
                  'Full Name',
                  user,
                  (val) {
                    if (val!.isEmpty) {
                      return 'This is required field';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextFieldWithTitle(
                  '',
                  'Enter Yor Email Address',
                  email,
                  (val) {
                    if (val!.isEmpty) {
                      return 'This is required field';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    counterText: '',
                    labelStyle: TextStyle(color: kGreyColor, fontSize: 14, fontWeight: FontWeight.w400),
                    labelText: 'Phone Number',
                    fillColor: kFilledColor,
                    filled: true,
                    errorStyle: const TextStyle(color: Colors.red, fontFamily: 'regular', fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kBorderSide)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kBorderSide)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kBorderSide)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kBorderSide)),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextFieldWithTitle('', 'Enter Password', password,
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
                CheckboxListTile(
                  title: Text(
                    "I agree with Terms & Privacy",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                  side: BorderSide(
                    color: HexColor('#BFBFBF'),
                  ),
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                const SizedBox(
                  height: 10,
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
                        onTap: () async {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kButtonColor,
                          ),
                          child: const Center(
                              child: Text(
                            "Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                          )),
                        ),
                      ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color:Provider.of<AppStateNotifier>(context).isDarkMode?Colors.white: HexColor('#0e0e0e'), fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.8),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) => const Login_Page()), (route) => false);
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(color: HexColor('#8379b4'), fontSize: 13, letterSpacing: 0.8),
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
