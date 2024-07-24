import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_task/cubits/register_cubit/states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    print("dfsfsdfdfdsfds: $email");
    emit(AuthLoading());
    try {
      print("EMAIL22: $email");
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("EMAIL: $email");
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      print("ERRORRRR: ${e.toString()}");
      emit(AuthFailure(e.toString()));
    }
  }
}
