import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/user.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/authentication_service.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/api.dart';
import '../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  User get user => _authenticationService.user;
   Api _api = locator<Api>();
 
  Future<bool> login(String email,String pass) async {
    setState(ViewState.Busy);
    var success = await _authenticationService.login(email, pass);
    notifyListeners();
    setState(ViewState.Idle);
    return success;
  }

}
