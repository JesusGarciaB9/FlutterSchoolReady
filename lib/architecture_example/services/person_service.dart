import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/person.dart';
import '../locator.dart';
import '../models/course.dart';
import '../models/course_detail.dart';
import '../models/course_detail.dart';
import 'api.dart';

class PersonService {
  Api _api = locator<Api>();

  String _user;
  String _token;
  int _idcourse;
   List<Person> _personas = [];
   CourseDetail _curso;
     CourseDetail get curso => _curso;

 /*  Future getCourse( String user, String token, int courseId) async {
    setState(ViewState.Busy);
    courseDetail = await _api.getCourse(user, token, courseId);
    setState(ViewState.Idle);
  }*/ 
  
   Future getCourse( String user, String token, int courseId) async {
    _user = user;
    _token = token;
    _idcourse = courseId;
    try {
       _curso = await _api.getCourse(user, token,courseId);
    } catch (err) {
      print('service getCourses ${err.toString()}');
      return Future.error(err.toString());
    }
  } 


  Future addPerson( int idcourse) async {
    
    
    _idcourse = idcourse;
    try {
      Person student = await _api.addPerson(_user, _token,_idcourse);
      _curso.students.add(student);
    } catch (err) {
      print('service addCourse ${err.toString()}');
      return Future.error(err.toString());
    }
  }
}
