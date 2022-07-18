import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Milestone2DraftVivienFirebaseUser {
  Milestone2DraftVivienFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Milestone2DraftVivienFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Milestone2DraftVivienFirebaseUser>
    milestone2DraftVivienFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Milestone2DraftVivienFirebaseUser>(
            (user) => currentUser = Milestone2DraftVivienFirebaseUser(user));
