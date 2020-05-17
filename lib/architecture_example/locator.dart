import 'package:f_202010_provider_get_it/architecture_example/ui/profesor_view.dart';
import 'package:get_it/get_it.dart';

import 'services/api.dart';
import 'services/authentication_service.dart';
import 'services/person_service.dart';
import 'services/couses_service.dart';
import 'viewmodels/coursedetailmodel.dart';
import 'viewmodels/homemodel.dart';
import 'viewmodels/loginmodel.dart';
import 'viewmodels/studentModel.dart';
import 'viewmodels/profesormodel.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() =>   CourseService());
    locator.registerLazySingleton(() =>   PersonService());
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CourseDetailModel());
  locator.registerFactory(() => StudentModel());
    locator.registerFactory(() => ProfesorModel());
}
