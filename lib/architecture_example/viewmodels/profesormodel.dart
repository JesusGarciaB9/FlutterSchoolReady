import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/api.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/person.dart';
import '../locator.dart';

class ProfesorModel extends BaseModel {
  Api _api = locator<Api>();

  Person profesor;

    Future getProfesor(String username,String token,int id) async {
    setState(ViewState.Busy);
    profesor = await _api.getProfesor(username, token,id);
    setState(ViewState.Idle);
  }
}
