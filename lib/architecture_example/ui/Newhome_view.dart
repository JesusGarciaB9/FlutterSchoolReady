import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/ui/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/homemodel.dart';
import 'home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
    
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Courses,Professors,Students"),
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
 
                   body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
  
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RaisedButton(
                  onPressed: ()  {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseListView()),
                                  );
                  },
                  child: Text('Ver cursos'),
                ),
              ),
            ],
          ),
        ),
      ),
                          )
                          );
  }

  

   
 

 
}
