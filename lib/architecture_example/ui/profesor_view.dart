import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/studentModel.dart';
import '../viewmodels/profesormodel.dart';


class ProfesorView extends StatelessWidget {
    final int profesorid;
  ProfesorView({this.profesorid});
  @override
  Widget build(BuildContext context) {
  return BaseView<ProfesorModel>(
        onModelReady: (model) => model.getProfesor(
            Provider.of<AuthProvider>(context).username,
            Provider.of<AuthProvider>(context).token,profesorid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Profesor Data"),
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
                    child: model.profesor == null
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
                        child: Text('Nombre : ${model.profesor.name}')
                        ),
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                      Center(
                        child: Text('email : ${model.profesor.email}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('telefono : ${model.profesor.phone}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('ciudad : ${model.profesor.city}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('País: ${model.profesor.country}')
                        ),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                          Center(
                        child: Text('Username : ${model.profesor.username}')
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