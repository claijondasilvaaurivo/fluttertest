import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class LoginAppAuthUser {
  LoginAppAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LoginAppAuthUser> loginAppAuthUserSubject =
    BehaviorSubject.seeded(LoginAppAuthUser(loggedIn: false));
Stream<LoginAppAuthUser> loginAppAuthUserStream() => loginAppAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
