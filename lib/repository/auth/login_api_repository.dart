import 'package:bloc_clean_coding_project/models/user/user_model.dart';

abstract class LoginRepository{

  @override
  Future<UserModel> loginApi(dynamic data);

}