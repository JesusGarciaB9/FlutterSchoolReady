import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/ui/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';

class CourseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => getData(context, model),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Course list"),
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
            floatingActionButton: floating(context, model),
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: model.courses == null
                        ? Text('No data')
                        : _list(model, context),
                    //Column(
                    //       crossAxisAlignment: CrossAxisAlignment.stretch,
                    //       children: <Widget>[
                    //         Center(child: Text('${model.courses.length}')),
                    //         FlatButton(
                    //             child: Text('get Detail'),
                    //             onPressed: () =>
                    //                 getDetail(context, model.courses[0].id))
                    //         ],
                    //      )
                  )));
  }

  void getData(BuildContext context, HomeModel model) async {
    model
        .getCourses(Provider.of<AuthProvider>(context).username,
            Provider.of<AuthProvider>(context).token)
        .catchError((error) async {
      print("getCourses got error: " + error);
      await _buildDialog(context, 'Alert', 'Need to login');
      Provider.of<AuthProvider>(context, listen: false).setLogOut();
    });
  }

  void getDetail(BuildContext context, int courseId) async {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => CourseDetailView(courseId: courseId)),
    );
  }

  Widget _list(model, context) {
    return ListView.builder(
      itemCount: model.courses.length,
      itemBuilder: (context, posicion) {
        var element = model.courses[posicion];
        return _item(element, posicion, context);
      },
    );
  }

  Widget _item(Course element, int posicion, context) {
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Icon(
                    Icons.work,
                    size: 48.0,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.all(10),
                    child: Text(element.name),
                  ),
                ),
                FlatButton(
                    child: Text('ver curso'),
                    onPressed: () => getDetail(context, element.id)),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget floating(BuildContext context, HomeModel model) {
    return FloatingActionButton(
        onPressed: () => _onAdd(context, model),
        tooltip: 'Add task',
        child: new Icon(Icons.add));
  }

  void _onAdd(BuildContext context, HomeModel model) async {
    try {
      await model.addCourse();
    } catch (err) {
      print('upsss ${err.toString()}');
      await _buildDialog(context, 'Alert', 'Need to login');
      Provider.of<AuthProvider>(context, listen: false).setLogOut();
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
}
