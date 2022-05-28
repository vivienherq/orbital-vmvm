import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OrbitalMilestone1TestVivienFirebaseUser {
  OrbitalMilestone1TestVivienFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OrbitalMilestone1TestVivienFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OrbitalMilestone1TestVivienFirebaseUser>
    orbitalMilestone1TestVivienFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<OrbitalMilestone1TestVivienFirebaseUser>((user) =>
            currentUser = OrbitalMilestone1TestVivienFirebaseUser(user));
