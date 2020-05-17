import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/studentModel.dart';
import '../viewmodels/loginmodel.dart';


class EstudiantesView extends StatelessWidget {
    final int studentid;
  EstudiantesView({this.studentid});
  @override
  Widget build(BuildContext context) {
  return BaseView<StudentModel>(
        onModelReady: (model) => model.getStudent(
            Provider.of<AuthProvider>(context).username,
            Provider.of<AuthProvider>(context).token,studentid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Student Data"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .setLogOut();
                  },
                ),
              ],
            ),
  
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: model.student == null
                        ? Text('No data')
                        : 
                       Center(   
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                      Center(
                        child: Text('Nombre : ${model.student.name}')
                        ),
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                      Center(
                        child: Text('email : ${model.student.email}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('telefono : ${model.student.phone}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('ciudad : ${model.student.city}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('País: ${model.student.country}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('Username : ${model.student.username}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                             
                    ],
                  ) 
                  
                  ),
                        
                          )
                          )
                          );
  }

 
}
