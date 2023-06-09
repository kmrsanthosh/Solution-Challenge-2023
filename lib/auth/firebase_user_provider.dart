import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GoogledcFirebaseUser {
  GoogledcFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GoogledcFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GoogledcFirebaseUser> googledcFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GoogledcFirebaseUser>(
      (user) {
        currentUser = GoogledcFirebaseUser(user);
        return currentUser!;
      },
    );
