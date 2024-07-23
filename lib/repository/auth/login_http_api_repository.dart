import '../../utils/app_url.dart';
import '../../data/network/network_services_api.dart';
import '../../models/user/user_model.dart';
import 'login_api_repository.dart';

class LoginHttpApiRepository implements LoginRepository{

  final _api = NetworkServicesApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginUrl, data);
    return UserModel.fromJson(response);
  }

}