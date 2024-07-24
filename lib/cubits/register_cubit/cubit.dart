import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_task/cubits/register_cubit/states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<User?> signUp(String email, String password) async {
    print("Attempting to sign up with email: $email");
    emit(AuthLoading());

    try {
      // Attempt to create a user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Log the successful email sign-up
      print("User signed up with email: ${userCredential.user?.email}");
      // Emit success state with the user credential
      emit(AuthSuccess(userCredential.user!));
      return userCredential.user;
    } catch (e) {
      // Log and handle errors
      print("Sign-up error: ${e.toString()}");
      emit(AuthFailure(e.toString()));
    }
    return null;
  }
}
