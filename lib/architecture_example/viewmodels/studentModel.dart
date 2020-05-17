import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/api.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/person.dart';
import '../locator.dart';

class StudentModel extends BaseModel {
  Api _api = locator<Api>();

  Person student;

    Future getStudent(String username,String token,int id) async {
    setState(ViewState.Busy);
    student = await _api.getStudent(username, token,id);
    setState(ViewState.Idle);
  }
}
