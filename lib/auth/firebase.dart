import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBackend {
  static String? _verificationId;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static confirmMobileNumber(mobile) async {
    print('my mobile number is' + mobile);
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(mobile)
          .get();
      if (snapshot.exists) {
        print('snapshot is' + snapshot.exists.toString());
      } else {
        print('snapshot else is' + snapshot.exists.toString());
        await _auth.verifyPhoneNumber(
          phoneNumber: mobile,
          codeSent: (verificationId, forceResendingToken) {
            _verificationId = verificationId;
          },
          verificationCompleted: (phoneAuthCredential) {
            // signInWithPhone(phoneAuthCredential);
          },
          verificationFailed: (error) {
            // emit( AuthErrorState(error.message.toString()) );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationId = verificationId;
          },
        );
      }
    } catch (e) {
      print('okay' + e.toString());
    }
  }
}
