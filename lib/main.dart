import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footwearclub/constants/theme.dart';
import 'package:footwearclub/seller/SellerMainScreen.dart';
import 'package:get/get.dart';

import 'authentication/shred_pref.dart';
import 'authentication/sign_up/auth_google.dart'; 
import 'buyer/BuyerMainScreen.dart';
import 'splashscreen/splash.dart';

 
Future<void> main() async {
  
    
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp(
      defaultHome: (true == await getLoggedIn()) ?  googlecontroller.usertype.value =="seller"? const SellerMainScreen():  const BuyerMainScreen() :  Splash_Screen()));
}

class MyApp extends StatelessWidget {
  final Widget? defaultHome;

  
  
  const MyApp({Key? key, this.defaultHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Footwear Club',
      theme: theme(),
      home: defaultHome,
    );
  }
}
