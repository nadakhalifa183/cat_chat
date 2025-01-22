import 'package:bloc/bloc.dart';
import 'package:chat_app/helper/show_snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: "weak password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: "e-mail already exist "));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: "there is something wrong , try again"));
    }
  }
}
