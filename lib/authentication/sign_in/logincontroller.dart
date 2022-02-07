import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Googlecontroller extends GetxController {
  RxString usertype = "".obs;
  RxBool islogin = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn(
   
  );
  var googleuser = Rx<GoogleSignInAccount?>(null);
      User? user;

  // Future<void> handleSignIn() async {
  //   await Firebase.initializeApp();
  //   try {
  //     googleuser.value = await googleSignIn.signIn(
        
  //     );
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleuser.value!.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final UserCredential authResult =
  //       await _auth.signInWithCredential(credential);
  //        user = authResult.user;

  //        print(user!.displayName);
  //        print(user!.email);
  //        print(user!.photoURL);
  //        print(user!.phoneNumber);
  //        print(user!.uid);

  //        islogin.value=true;
  //        print("islogin ${islogin.value}");
  // }

}
