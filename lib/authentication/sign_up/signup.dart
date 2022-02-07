import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:footwearclub/authentication/sign_in/bussinessname_dialog.dart';
import 'package:footwearclub/authentication/sign_in/loginsucces.dart';
import 'package:footwearclub/seller/SellerMainScreen.dart'; 
import 'package:footwearclub/splashscreen/splashdata.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../shred_pref.dart';
import '../sign_in/login.dart';
import 'auth_google.dart';
import 'signupform.dart';

class Signup_Screen extends StatefulWidget {
  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  var collection = FirebaseFirestore.instance.collection('seller');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? businesname;
  void getBusinessname() {
    getUid().then((value) {
      collection.doc(value).get().then((DocumentSnapshot ds) {
        Map data = ds.data() as Map;
        businesname = data["businessname"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getBusinessname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Text("Register", style: headingStyle),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Google,
                        padding: const EdgeInsets.all(9),
                        text: "Sign up with Google",
                        onPressed: () async {
                          signInWithGoogle().then((value) {
                            if (value != null) {
                              if (googlecontroller.usertype.value == "seller") {
                                businesname == ""
                                    ? bussinessNameDialog(context)
                                    : Get.offAll(const  SellerMainScreen());
                              }
                              else
                              {
                                Get.off(Login_succes());
                              }
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(Login_Screen());
                        },
                        child: Text(
                          "SIgn In",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
