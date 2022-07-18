import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OrbitalVmvmFirebaseUser {
  OrbitalVmvmFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OrbitalVmvmFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OrbitalVmvmFirebaseUser> orbitalVmvmFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<OrbitalVmvmFirebaseUser>(
        (user) => currentUser = OrbitalVmvmFirebaseUser(user));
