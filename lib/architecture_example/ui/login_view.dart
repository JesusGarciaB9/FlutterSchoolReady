import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/components/widgetsbasicos.dart';
import 'signup.dart';
class LoginView extends StatelessWidget {
   final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            body: 
           // Provider.of<User>(context, listen: false).logged == true ?  CourseListView() :
            model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                         
                                  color: Theme.of(context).accentColor),
                              height: 30,
                              width: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            email(emailController),
                            password(passController),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text("Ingresar "),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
                                onPressed: () async {
                               

                                  final String email =
                                      emailController.text.trim();
                                  final String password =
                                      passController.text.trim();

                                  //Calling the method from provider.
                                  var loginSuccess = await model.login(email,password);
                                        if (loginSuccess) {
                                              print('LoginView loginSuccess setting up setLoggedIn ');
                                          Provider.of<AuthProvider>(context, listen: false).setLoggedIn(model.user.username,model.user.token);
                                       }
                                       
                                },
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text("¿No tienes una cuenta? crea una"),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                )
                )
         
                ;
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
}
