import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/coursedetailmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'estudiantes_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/person.dart';
import 'profesor_view.dart';

class CourseDetailView extends StatelessWidget {
  final int courseId;
  CourseDetailView({this.courseId});
  @override
  Widget build(BuildContext context) {
    return BaseView<CourseDetailModel>(
        onModelReady: (model) =>  getData(context,model,courseId),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Course detail"),
            ),
             floatingActionButton: floating(context, model),
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())

                :   Center(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                       Center(   
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                      Center(
                        child: Text('Curso : ${model.course.name}')
                        ),
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                      Center(
                        child: Text('Profesor : ${model.course.professor.name}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                             
                    ],
                  ) 
                  
                  ),
                  Container(
                    height: 350.0,
                    child: _list(model,context),
                  ),
             
             


                    ],

                  ),
                  )
                
                
                 
                  )
                  );
  }
    
  Widget _list(model,context) {

    return ListView.builder(
            
      itemCount: model.course.students.length,
     
      itemBuilder: (context, posicion) {
        var element = model.course.students[posicion];
        var profesorID = model.course.professor.id;
        return _item(element, posicion,context,profesorID);
      },
    );
  }
  void getDetail(BuildContext context, int studentId) async {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => EstudiantesView(studentid: studentId )),
    );
  }
    void getDetailprofesor(BuildContext context, int profesorId) async {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ProfesorView(profesorid: profesorId )),
    );
  }
    Widget floating(BuildContext context, CourseDetailModel model) {
    return FloatingActionButton(
        onPressed: () => _onAdd(context, model),
        tooltip: 'Add task',
        child: new Icon(Icons.add));
  }
    void _onAdd(BuildContext context, CourseDetailModel model) async {
    try {
      await model.addPerson(courseId);
    } catch (err) {
      print('upsss ${err.toString()}');
 
    }
  }
  Future<void> _buildDialog(BuildContext context, _title, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
    void getData(BuildContext context, CourseDetailModel  model,coursId) async {
    model.getCourse(
            Provider.of<AuthProvider>(context).username,
            Provider.of<AuthProvider>(context).token,courseId)
        .catchError((error) async {
          print("getCourses got error: " + error);
          await _buildDialog(context, 'Alert', 'Need to login');
          Provider.of<AuthProvider>(context, listen: false).setLogOut();
    });
  }
    Widget _item(Person element, int posicion,context,int profeId) {
     
     int id =  element.id;
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(20.0),
        color:   Colors.green[100],
        child: Column(
 
          children: <Widget>[
            Row(
              
              children: <Widget>[
                
            
                Container(
                
                  child: Icon(
                    Icons.work,
                    size: 48.0,
                    color: Colors.grey,
                  ),
                ),
                
               Container(
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.all(10),
                  
                    child: Text(element.name),
                      
                  ),
                ),
               Container(
                  child: Column(
 
                  children: <Widget>[
              FlatButton(                
                                  child: Text('ver detalles estudiante'),                            
                                  onPressed: () =>
                                      getDetail(context,element.id), 
                                      ),         
                FlatButton(                
                                 child: Text('ver detalles profesor'),                            
                                  onPressed: () =>
                                      getDetailprofesor(context,profeId), 
                                      ),   


          ])
               ),
    
                Spacer(), 
              ],
            ),
 
          ],
        ),
      ),
    );
  }
}
