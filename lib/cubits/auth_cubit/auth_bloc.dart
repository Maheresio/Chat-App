
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {

          emit(LoginSuccess());
        } on FirebaseAuthException {
          emit(LoginFailure());
        }
      }
      else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {

          emit(RegisterSuccess());
        } on FirebaseAuthException {
          emit(RegisterFailure());
        }
      }
    }


  );
}}
