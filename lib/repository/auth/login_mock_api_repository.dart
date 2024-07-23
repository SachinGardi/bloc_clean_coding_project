
import '../../models/user/user_model.dart';
import 'login_api_repository.dart';

class LoginMockApiRepository implements LoginRepository{

  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 3));
    final response = {
      'token':'sd4y4jbsfbjb'
    };
    return UserModel.fromJson(response);
  }

}