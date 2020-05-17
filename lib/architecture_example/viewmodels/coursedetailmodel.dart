import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/api.dart';
 import 'package:f_202010_provider_get_it/architecture_example/services/person_service.dart';
import '../locator.dart';
import '../models/course_detail.dart';
import '../models/person.dart';

class CourseDetailModel extends BaseModel {
  Api _api = locator<Api>();

 
  PersonService _personService= locator<PersonService>();
   

  CourseDetail get course => _personService.curso;

  

  
    Future getCourse(String user, String token,int courseId) async {
    setState(ViewState.Busy);
    try {
      await _personService.getCourse(user, token,courseId);
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      print('homemodel getCourses ${err.toString()}');
       setState(ViewState.Idle);
      return Future.error(err.toString());
    }

   
  }

  Future addPerson(int courseId) async {
    setState(ViewState.Busy);
  try {
      await  _personService.addPerson(courseId); 
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      print('AGREGADO FALLIDOO ${err.toString()}');
       setState(ViewState.Idle);
      return Future.error(err.toString());
    }
  }
}
