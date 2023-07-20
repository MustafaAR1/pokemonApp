// Authentication Cubit
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationCubit(this._firebaseAuth) : super(AuthenticationInitial());

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }
}
