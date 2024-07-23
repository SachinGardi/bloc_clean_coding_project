import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding_project/repository/auth/login_api_repository.dart';
import 'package:bloc_clean_coding_project/services/session_manager/session_controller.dart';
import 'package:bloc_clean_coding_project/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../main.dart';
import '../../models/language/language_model.dart';

part 'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvent,LoginStates>{

  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}):super(const LoginStates()){
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<Login>(_login);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  void _onEmailChange(EmailChange event, Emitter<LoginStates>emit){
      emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginStates>emit){
    emit(state.copyWith(password: event.password));
  }

  Future<void> _login(Login event, Emitter<LoginStates>emit) async {

    Map data = {
      'email':state.email,
      'password':state.password
    };
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then((value) async {
      if(value.error.isNotEmpty){
        emit(state.copyWith(message: value.error.toString(),postApiStatus: PostApiStatus.error));
      }
      else{
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(message: 'Login Successful',postApiStatus: PostApiStatus.success));
      }

    }).onError((error, stackTrace) {
      emit(state.copyWith(message: error.toString(),postApiStatus: PostApiStatus.error));
    });
  }

  _onChangeLanguage(ChangeLanguage event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }


}