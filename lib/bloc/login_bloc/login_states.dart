part of 'login_bloc.dart';

class LoginStates extends Equatable{

  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String message;
  final Language selectedLanguage;


  const LoginStates({this.email = '',this.password = '',this.postApiStatus = PostApiStatus.initial,this.message = '',this.selectedLanguage = Language.english});

  LoginStates copyWith({String? email, String? password,PostApiStatus? postApiStatus,String? message, Language? selectedLanguage}){
    return LoginStates(email: email??this.email,password: password??this.password,postApiStatus: postApiStatus??this.postApiStatus,message: message??this.message,selectedLanguage: selectedLanguage??this.selectedLanguage);
}

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,postApiStatus,message,selectedLanguage];

}